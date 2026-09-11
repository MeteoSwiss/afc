#' 2AFC For Ordinal Polychotomous Observations And Probabilistic Forecasts
#'
#' Routine to calculate the Generalized Discrimination Score (aka
#' Two-Alternatives Forced Choice Score 2AFC) for the situation of
#' polychotomous observations (ordinal) and discrete probabilistic forecasts
#'
#' This routine applies Eq.16 of Mason and Weigel (2009) to calculate the 2AFC.
#'
#' @param obsv vector with polychotomous observations (values in \{1,..,m\})
#' @param fcst two-dimensional array with forecast probabilities for the m
#' categories; dim(fcst)[1] = length(obsv); dim(fcst)[2] = m
#' @param m number of observation categories (default = 3)
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
#'   data(cnrm.nino34.mp)
#'   obsv = cnrm.nino34.mp$obsv
#'   fcst = cnrm.nino34.mp$fcst
#'   afc.mp(obsv,fcst,4)
#' @export afc.mp
afc.mp = function(obsv, fcst, m=3, na.rm = FALSE) {
  if (na.rm) {
    d <- .complete_cases(obsv, fcst); obsv <- d$obsv; fcst <- d$fcst
  } else if (anyNA(obsv) || anyNA(fcst)) {
    return(NA_real_)
  }
  n.vector = rep(NA,m)
  for (k in 1:m) n.vector[k] = length(which(obsv == k))
  numer = 0
  denom = 0
  for (k in 1:(m-1)) for (l in (k+1):m){
    index.k = which(obsv == k)
    index.l = which(obsv == l)
    if ( (length(index.l) > 0) & (length(index.k) > 0)){
      p.k = fcst[index.k,,drop=FALSE]
      p.l = fcst[index.l,,drop=FALSE]
      test = 0
      for (i in 1:n.vector[k]) for (j in 1:n.vector[l]){
        p.ki = p.k[i,]
        p.lj = p.l[j,]
        numer11 = 0
        for (r in 1:(m-1)) for (s in (r+1):m){
          numer11 = numer11 + p.ki[r]*p.lj[s]
        }
        f = numer11/(1-sum(p.ki*p.lj))
        if (!is.finite(f)) f = 0.5
        test = test + 0.5*(f == 0.5) + (f > 0.5)
      }
      numer = numer + test
      denom = denom + n.vector[l]*n.vector[k]
    }
  }
  p.afc = numer/denom
  type.flag = 1
  return(p.afc)
}
