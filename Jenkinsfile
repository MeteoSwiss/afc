class Globals {
    // the builder version
    static String builder_version = 'latest'

    // ubuntu versiion
    static String ubuntu_version = 'jammy'

    // R version
    static String r_version = '4.2'

    // docker image
    static String docker_image = ''

    // This parameters will be adapted during preparation stage
    // package name and version (from DESCRIPTION file)
    static String package_name = ''
    static String package_version = ''
    static String package_file = ''

    // git tag
    static String git_tag = ''

    // deployment stages setup (check vs deploy vs abort)
    static String deploy_stages = 'check'

    // documentation tag (develop vs main)
    static String documentation_tag = 'develop' 

    // publish documentation 
    static boolean documentation_publish = false
}

@Library('dev_tools@main') _
pipeline {
    agent { label 'docker' }

    environment {
	NEXUS_REPO = "https://nexus.meteoswiss.ch/nexus/repository/r-mch/src/contrib"
	DOCKER_REPO = "dockerhub.apps.cp.meteoswiss.ch"
    }

    options {	
	gitLabConnection('CollabGitLab')

	// do not checkout the git-repo by default, get only Jenkinsfile
	// checkout is done in 'Checkout' stage into source directory
	skipDefaultCheckout(true)

        // New jobs should wait until older jobs are finished
        disableConcurrentBuilds()
        // Discard old builds - keep 5
        buildDiscarder(logRotator(numToKeepStr: '5'))
        //buildDiscarder(logRotator(artifactDaysToKeepStr: '7',
	//			  artifactNumToKeepStr: '1',
        //                          daysToKeepStr: '7',
	//			  numToKeepStr: '1'))
        // Timeout the pipeline build after 1 hour
        timeout(time: 1, unit: 'HOURS')
    }

    stages {
        stage('Checkout') {
            steps {
                updateGitlabCommitStatus name: 'Build', state: 'running'
		// checkout into source directory
		dir('source'){
                    checkout scm
		}
            }
        }
	stage('Preparation') {
	    steps {		
		script {		    
		    // get Global variables from R-package DESCRIPTION
		    Globals.package_name = sh( script: 'grep "Package:" source/DESCRIPTION | cut -d":" -f2', returnStdout: true).trim()
		    Globals.package_version = sh( script: 'grep "Version:" source/DESCRIPTION | cut -d":" -f2', returnStdout: true).trim()

		    // set package name
		    Globals.package_file = "${Globals.package_name}_${Globals.package_version}.tar.gz"

		    echo "Package specs: ${Globals.package_file}"
		    		    
		    // get Global variables from git
		    Globals.git_tag = sh( script: 'cd source; git tag --contains | head -1 | sed "s/[a-zA-Z]//g"', returnStdout: true).trim()
		    
		    echo "GIT specs: ${Globals.git_tag}, ${env.TAG_NAME}, ${env.BRANCH_NAME}"
		    
		    // set docker image name
		    Globals.docker_image = "${DOCKER_REPO}/mch/ubuntu-${Globals.ubuntu_version}/r-${Globals.r_version}/builder:${Globals.builder_version}"

		    echo "Docker specs: ${Globals.docker_image}"

		    // decide what to do in next stages
		    if (env.BRANCH_NAME != "main" && env.BRANCH_NAME != "master"){
			echo "Do only package check for ${Globals.package_name} as branch is ${env.BRANCH_NAME} (not main)."
			Globals.deploy_stages = "check"
		    } else {
			if ( Globals.git_tag == "" ){ // no tag == treat as development version
			    echo "Do only package check for ${Globals.package_name} as branch is ${env.BRANCH_NAME} but without tag."
			    Globals.deploy_stages = "check"
			} else { // with tag == treat as deployment version
			    echo "Do package check, deploy and docu for ${Globals.package_name} as branch is ${env.BRANCH_NAME} with tag ${Globals.git_tag}."
			    Globals.deploy_stages = "deploy"
			    Globals.documentation_publish = true
			    Globals.documentation_tag = env.BRANCH_NAME
			}
		    }

		    echo "Deploy specs: ${Globals.deploy_stages}"
		    echo "Docu specs: ${Globals.documentation_publish} ${Globals.documentation_tag}"
		}
		
		dir('build-lib'){
		    sh 'pwd -P'
		}		
		dir('docs'){
		    sh 'pwd -P'
		}
	    }
	}

        stage('Check') {
	    when {
		expression { return Globals.deploy_stages != "abort" }
	    }
            steps {
		script {
                    withCredentials([usernamePassword(credentialsId: 'openshift-nexus',
			 			      passwordVariable: 'NXPASS',
						      usernameVariable: 'NXUSER')]) {
			runWithDocker "${Globals.docker_image}", "/src/scripts/start_r_builder.bash docu_check", true
                    }
		}
            }
	    post{
		always {
		    echo "Check complete"
		    junit allowEmptyResults: true, keepLongStdio: true, testResults: "source/${Globals.package_name}.Rcheck/tests/testthat/junit_result.xml"
		    archiveArtifacts allowEmptyArchive: true, artifacts: "source/${Globals.package_name}.Rcheck/*.log", followSymlinks: false
		}
	    }
	}
	
	stage('Deploy Package') {
	    when {
		expression { return Globals.deploy_stages == "deploy" }
	    }
            steps {
		echo "Upload Package to Nexus"
		script{
		    withCredentials([usernamePassword(credentialsId: 'r-nexus',
						      passwordVariable: 'NXPASS',
						      usernameVariable: 'NXUSER')]) {
            		sh """#!/bin/bash
                        cd source
                        if [ -f ${Globals.package_file} ]; then
                            status=\$(curl -v --user ${NXUSER}:${NXPASS} -w "%{http_code}" --upload-file ${Globals.package_file} ${NEXUS_REPO}/${Globals.package_file})
                            if [ "\$status" -ne 200 ]; then
                                echo "Error: curl upload failed due to server return code - \$status"
                                exit 1
                            fi
                        else
                            echo "${Globals.package_file} does not exist"
                        fi
                        cd ${WORKSPACE}
                    """
		    }
		}
	    }
	}
	
	stage('Publish Documentation') {
	    when {
		expression { Globals.documentation_publish }
	    }
            environment {
		PATH = "${HOME}/tools/openshift-client-tools:$PATH"
		KUBECONFIG = "${WORKSPACE}/.kube/config"
            }
            steps {
		withCredentials([string(credentialsId: "documentation-main-prod-token",
					variable: 'TOKEN')]) {
                    sh "oc login https://api.cp.meteoswiss.ch:6443 --token \$TOKEN"
                    publishDoc "${WORKSPACE}/docs/", Globals.package_name, Globals.package_version, 'R', Globals.documentation_tag
		}
            }
            post {
		cleanup {
                    sh 'oc logout || true'
		}
            }
	}
    }
    
    post {
	always {
            echo "Build stage complete"
	}
	failure {
            echo "Build failed"
            updateGitlabCommitStatus name: 'Build', state: 'failed'
            emailext(subject: "${currentBuild.fullDisplayName}: ${currentBuild.currentResult}",
		     body: "Job ${currentBuild.currentResult}: ${JOB_NAME} #${BUILD_NUMBER}\n\n"+
		     "Check console output at ${BUILD_URL} to view the results. \n\n",
                     recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
		     attachLog: true)
	}
	aborted {
            echo "Build aborted"
            updateGitlabCommitStatus name: 'Build', state: 'canceled'
            emailext(subject: "${currentBuild.fullDisplayName}: ${currentBuild.currentResult}",
		     body: "Job ${currentBuild.currentResult}: ${JOB_NAME} #${BUILD_NUMBER}\n\n"+
		     "Check console output at ${BUILD_URL} to view the results. \n\n",
                     recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
		     attachLog: true)
	}
	success {
            echo "Build succeeded"
            updateGitlabCommitStatus name: 'Build', state: 'success'
	}
    }
}
