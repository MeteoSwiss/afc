#' 2AFC For Dichotomous Observations and Ensemble Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of dichotomous
#' observations and ensemble forecasts
#'
#' This routine first ranks the ensemble forecasts (see
#' \code{\link{rank.ensembles}}) and then calculates the 2AFC-score with Eq.2
#' of Mason and Weigel (2009).
#'
#' @param obsv vector with dichotomous observations (values in {0,1})
#' @param fcst two-dimensional array with ensemble forecasts; dim(fcst)[1] =
#' length(obsv); dim(fcst)[2] = ensemble size
#' @return \item{ p.afc }{ Value of Generalized Discrimination (2AFC) Score }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc}} \code{\link{rank.ensembles}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.de)
#'   obsv = cnrm.nino34.de$obsv
#'   fcst = cnrm.nino34.de$fcst
#'   afc.de(obsv,fcst)
#' @export afc.de
afc.de = function(obsv,fcst){
  event.index = which(obsv == 1)
  n1 = length(event.index)
  n0 = length(obsv)-n1
  ranks = rank.ensembles(fcst)
  rank.1 = ranks[event.index]
  p.afc = (sum(rank.1) - n1*(n1+1)/2)/(n1*n0)
  type.flag=1
  return(p.afc)
}
