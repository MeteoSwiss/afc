#' Rank Ensembles
#'
#' Routine to rank a set of given ensemble forecasts according to their "value"
#'
#' This routine ranks a set of ensemble forecasts according to their "value".
#' The higher the "value" of an ensemble forecasts, the higher the rank. The
#' following principle is applied: Assume two ensembles A and B are to be
#' ranked. Without loss of generality, we define A>B if the probability of a
#' random ensemble member of A being larger than a random ensemble member of B
#' exceeds 0.5. This probability is calculated by a 2AFC-like approach based on
#' Eq. 8 of Mason and Weigel (2009). By pairwise comparison of all ensembles,
#' the final ranking is obtained.
#'
#' @param fcst two-dimensional array with ensemble forecasts; dim(fcst)[1] =
#' number of ensemble forecasts; dim(fcst)[2] = number of ensemble members
#' @return \item{ ranks }{ vector with the ranks of the ensemble forecasts }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc.de}} \code{\link{afc.me}} \code{\link{afc.ce}}
#' \code{\link{afc}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.ce)
#'   fcst = cnrm.nino34.ce$fcst
#'   rank.ensembles(fcst)
#' @export rank.ensembles
rank.ensembles = function(fcst){
  nens    = dim(fcst)[2]
  n       = dim(fcst)[1]
  ranks = rep(1,n)
  for (i in 2:n) for (j in 1:(i-1)){
    fcst.tmp.event = fcst[i,]
    fcst.tmp.nonev = fcst[j,]
    rank.1 = rank(c(fcst.tmp.event,fcst.tmp.nonev))[1:nens]
    p.afc = (sum(rank.1) - nens*(nens+1)/2)/nens^2
    if (p.afc > 0.5) ranks[i] = ranks[i]+1
    if (p.afc < 0.5) ranks[j] = ranks[j]+1
    if (p.afc == 0.5) {
      ranks[i] = ranks[i]+0.5
      ranks[j] = ranks[j]+0.5
    }
  }
  return(ranks)
}
