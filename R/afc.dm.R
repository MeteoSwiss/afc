#' 2AFC For Dichotomous Observations And Ordinal Polychotomous Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of dichotomous
#' observations and (ordinal) polychotomous forecasts
#'
#' This routine applies Eq.5 of in Mason and Weigel (2009) to calculate the
#' 2AFC.
#'
#' @param obsv vector with dichotomous observations (values in {0,1})
#' @param fcst vector of same length as \emph{obsv} with polychotomous
#' forecasts (values in {1,..,m})
#' @param mf number of forecast categories (default = 3)
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
#'   data(cnrm.nino34.dm)
#'   obsv = cnrm.nino34.dm$obsv
#'   fcst = cnrm.nino34.dm$fcst
#'   afc.dm(obsv,fcst,4)
#' @export afc.dm
afc.dm = function(obsv, fcst, mf=3, na.rm = FALSE) {
  if (na.rm) {
    d <- .complete_cases(obsv, fcst); obsv <- d$obsv; fcst <- d$fcst
  } else if (anyNA(obsv) || anyNA(fcst)) {
    return(NA_real_)
  }
  n1 = sum(obsv)
  n0 = length(obsv)-sum(obsv)
  fcst.1 = fcst[which(obsv == 1)]
  fcst.0 = fcst[which(obsv == 0)]
  if (mf == 1) stop("Please enter n/o categories")
  n0.mf = array(NA,mf)
  n1.mf = array(NA,mf)
  for (i in 1:mf){
    n0.mf[i] = length(which(fcst.0 == i))
    n1.mf[i] = length(which(fcst.1 == i))
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
