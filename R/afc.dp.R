#' 2AFC For Dichotomous Observations And Probabilistic Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of dichotomous
#' observations and discrete probabilistic forecasts
#'
#' This routine applies Eq.5 of Mason and Weigel (2009) to calculate the 2AFC.
#'
#' @param obsv vector with dichotomous observations (values in {0,1})
#' @param fcst vector of same length as \emph{obsv} with forecast probabilities
#' for the event to happen
#' @return \item{ p.afc }{ Value of Generalized Discrimination (2AFC) Score }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.dp)
#'   obsv = cnrm.nino34.dp$obsv
#'   fcst = cnrm.nino34.dp$fcst
#'   afc.dp(obsv,fcst)
#' @export afc.dp
afc.dp = function(obsv,fcst){
  n1 = sum(obsv)
  n0 = length(obsv)-sum(obsv)
  fcst.1  = fcst[which(obsv == 1)]
  fcst.0 = fcst[which(obsv == 0)]
  probs = sort(unique(fcst))
  mf    = length(probs)
  n0.mf = array(NA,mf)
  n1.mf = array(NA,mf)
  for (i in 1:mf){
    n0.mf[i] = length(which(fcst.0 == probs[i]))
    n1.mf[i] = length(which(fcst.1 == probs[i]))
  }
  summand1 = 0
  summand2 = 0
  for (i in 1:(mf-1)) for (j in (i+1):mf)
      summand1 = summand1 + n0.mf[i]*n1.mf[j]
  for (k in 1:mf)
      summand2 = summand2 + n0.mf[k]*n1.mf[k]
  p.afc = (summand1 + 0.5*summand2)/(n0*n1)
  type.flag = 1
  return(p.afc)
}
