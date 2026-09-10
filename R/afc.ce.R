#' 2AFC For Continuous Observations And Ensemble Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of continuous
#' observations and ensemble forecasts
#'
#' This routine applies Eq.24 of Mason and Weigel (2009) to calculate the 2AFC.
#'
#' @param obsv vector with real-valued observations
#' @param fcst two-dimensional array with ensemble forecasts;
#' dim(fcst)[1] = length(obsv); dim(fcst)[2] = ensemble size
#' @param na.rm logical; if \code{TRUE} pairs where \code{obsv} or
#'   \code{fcst} is \code{NA} are removed before scoring. Default
#'   \code{FALSE} returns \code{NA} if any input contains \code{NA}.
#' @return \item{ p.afc }{ Value of Generalized Discrimination (2AFC) Score }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.ce)
#'   obsv = cnrm.nino34.ce$obsv
#'   fcst = cnrm.nino34.ce$fcst
#'   afc.ce(obsv,fcst)
#' @export afc.ce
afc.ce = function(obsv, fcst, na.rm = FALSE) {
  if (na.rm) {
    d <- .complete_cases(obsv, fcst); obsv <- d$obsv; fcst <- d$fcst
  } else if (anyNA(obsv) || anyNA(fcst)) {
    return(NA_real_)
  }
  ranks = rank.ensembles(fcst)
  p.afc = 0.5*(1+stats::cor(ranks,obsv,method="kendall"))
  type.flag = 1
  return(p.afc)
}
