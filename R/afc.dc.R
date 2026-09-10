#' 2AFC For Dichotomous Observations And Continuous Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of dichotomous
#' observations and continuous forecasts
#'
#' This routine applies Eq.8 of Mason and Weigel (2009) to calculate the 2AFC.
#'
#' @param obsv vector with dichotomous observations (values in {0,1})
#' @param fcst vector of same length as \emph{obsv} with real-valued forecasts
#' @return \item{ p.afc }{ Value of Generalized Discrimination (2AFC) Score }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.dc)
#'   obsv = cnrm.nino34.dc$obsv
#'   fcst = cnrm.nino34.dc$fcst
#'   afc.dc(obsv,fcst)
#' @export afc.dc
afc.dc= function(obsv,fcst){
  event.index = which(obsv == 1)
  n1 = length(event.index)
  n0 = length(obsv)-n1
  fcst.1 = fcst[event.index]
  fcst.0 = fcst[-event.index]
  rank.1 = rank(fcst)[event.index]
  p.afc = (sum(rank.1) - n1*(n1+1)/2)/(n1*n0)
  type.flag=1
  return(p.afc)
}
