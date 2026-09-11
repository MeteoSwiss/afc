#' 2AFC For Ordinal Polychotomous Observations And Ensemble Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of
#' polychotomous observations (ordinal) and ensemble forecasts
#'
#' This routine first ranks the ensemble forecasts (see
#' \code{\link{rank.ensembles}}) and then calculates the 2AFC-score with Eq.18
#' of Mason and Weigel (2009).
#'
#' @param obsv vector with polychotomous observations (values in \{1,..,m\})
#' @param fcst two-dimensional array with ensemble forecasts; dim(fcst)[1] =
#' length(obsv); dim(fcst)[2] = ensemble size
#' @param m number of observation categories (default = 3)
#' @param na.rm logical; if \code{TRUE} pairs where \code{obsv} or
#'   \code{fcst} is \code{NA} are removed before scoring. Default
#'   \code{FALSE} returns \code{NA} if any input contains \code{NA}.
#' @return \item{ p.afc }{ Value of Generalized Discrimination (2AFC) Score }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc}} \code{\link{rank.ensembles}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.me)
#'   obsv = cnrm.nino34.me$obsv
#'   fcst = cnrm.nino34.me$fcst
#'   afc.me(obsv,fcst,4)
#' @export afc.me
afc.me = function(obsv, fcst, m=3, na.rm = FALSE) {
  if (na.rm) {
    d <- .complete_cases(obsv, fcst); obsv <- d$obsv; fcst <- d$fcst
  } else if (anyNA(obsv) || anyNA(fcst)) {
    return(NA_real_)
  }
  n.vector = rep(NA,m)
  for (k in 1:m){
    n.vector[k] = length(which(obsv == k))
  }
  numer = 0
  denom = 0
  for (k in 1:(m-1)) for (l in (k+1):m){
    index.event = which(obsv == k | obsv == l)
    fine.index = which(obsv[index.event] == l)
    ranks = rank.ensembles(fcst[index.event,])[fine.index]
    numer = numer + sum(ranks) - 0.5*n.vector[l]*(n.vector[l]+1)
    denom = denom + n.vector[k]*n.vector[l]
  }
  p.afc = numer/denom
  type.flag = 1
  return(p.afc)
}
