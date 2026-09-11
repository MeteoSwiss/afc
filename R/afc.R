#' Calculate Generalized Discrimination Score 2AFC
#'
#' This is the master routine for the calculation the Generalized
#' Discrimination Score (aka Two-Alternatives Forced Choice Score - 2AFC) as
#' described in the Paper of Mason and Weigel (2009). This routine requires, as
#' input, datasets of forecasts and corresponding observations, as well as a
#' specification of the verification context. The routine checks whether the
#' input data are consistent with the verification context, then calls the
#' appropriate function to calculate the 2AFC, and finally returns the 2AFC
#' skill value.
#'
#' Depending on the specific verification context (i.e. the choice for
#' \emph{obsv.type} and \emph{fcst.type}), this routine calls the appropriate
#' function(s) to calculate the 2AFC score. The following combinations of
#' \emph{obsv.type} and \emph{fcst.type} are possible: (1) "d-d"; (2) "d-m";
#' (3) "d-p"; (4) "d-c"; (5) "d-e"; (6) "m-m"; (7) "m-p"; (8) "m-c"; (9) "m-e";
#' (10) "n-n"; (11) "n-p"; (12) "c-c"; (13) "c-e". The required format of the
#' input data \emph{obsv} and \emph{fcst} depends on the verification
#' context:\cr
#'
#' (1) "d-d": \cr \emph{obsv}: vector with dichotomous observations (values in
#' \{0,1\})\cr \emph{fcst}: vector of same length as \emph{obsv} with dichotomous
#' forecasts (values in \{0,1\}) \cr
#'
#' (2) "d-m": \cr \emph{obsv}: vector with dichotomous observations (values in
#' \{0,1\})\cr \emph{fcst}: vector of same length as \emph{obsv} with
#' polychotomous forecasts (values in \{1,..,m\}) \cr
#'
#' (3) "d-p": \cr \emph{obsv}: vector with dichotomous observations (values in
#' \{0,1\})\cr \emph{fcst}: vector of same length as \emph{obsv} with forecast
#' probabilities for the event to happen \cr
#'
#' (4) "d-c": \cr \emph{obsv}: vector with dichotomous observations (values in
#' \{0,1\})\cr \emph{fcst}: vector of same length as \emph{obsv} with real-valued
#' forecasts \cr
#'
#' (5) "d-e": \cr \emph{obsv}: vector with dichotomous observations (values in
#' \{0,1\})\cr \emph{fcst}: two-dimensional array with ensemble forecasts;
#' dim(fcst)[1] = length(obsv); dim(fcst)[2] = ensemble size.\cr
#'
#' (6) "m-m": \cr \emph{obsv}: vector with polychotomous observations (values
#' in \{1,..,m\})\cr \emph{fcst}: vector of same length as \emph{obsv} with
#' polychotomous forecasts (values in \{1,..,m2\}) \cr
#'
#' (7) "m-p": \cr \emph{obsv}: vector with polychotomous observations (values
#' in \{1,..,m\})\cr \emph{fcst}: two-dimensional array with forecast
#' probabilities for the m categories; dim(fcst)[1] = length(obsv);
#' dim(fcst)[2] = m \cr
#'
#' (8) "m-c": \cr \emph{obsv}: vector with polychotomous observations (values
#' in \{1,..,m\})\cr \emph{fcst}: vector of same length as \emph{obsv} with
#' real-valued forecasts \cr
#'
#' (9) "m-e": \cr \emph{obsv}: vector with polychotomous observations (values
#' in \{1,..,m\})\cr \emph{fcst}: two-dimensional array with ensemble forecasts;
#' dim(fcst)[1] = length(obsv); dim(fcst)[2] = ensemble size.\cr
#'
#' (10) "n-n": \cr \emph{obsv}: vector with polychotomous observations (values
#' in \{1,..,m\})\cr \emph{fcst}: vector of same length as \emph{obsv} with
#' polychotomous forecasts (values in \{1,..,m\}) \cr
#'
#' (11) "n-p": \cr Same as "m-p".\cr
#'
#' (12) "c-c": \cr \emph{obsv}: vector with real-valued observations \cr
#' \emph{fcst}: vector of same length as \emph{obsv} with real-valued forecasts
#' \cr
#'
#' (13) "c-e": \cr \emph{obsv}: vector with real-valued observations \cr
#' \emph{fcst}: two-dimensional array with ensemble forecasts; dim(fcst)[1] =
#' length(obsv); dim(fcst)[2] = ensemble size.\cr
#'
#' @param obsv Vector of observations. The required format depends on the
#' specific verification context. More details below.
#' @param fcst Vector or two-dimensional array of forecasts. The required
#' format depends on the specific verification context. More details below.
#' @param obsv.type Character specifying the type of the observations. Possible
#' values: "d" (dichotomous), "m" (polychotomous with ordinal categories), "n"
#' (polychotomous with nominal categories), "c" (continuous).
#' @param fcst.type Character specifying the type of the forecasts. Possible
#' values: "d" (dichotomous), "m" (polychotomous with ordinal categories), "n"
#' (polychotomous with nominal categories), "p" (probabilistic), "c"
#' (continuous) and "e" (ensemble).
#' @param m Number of observation or forecast categories (only required if
#' obsv.type or fcst.type equals "m" or "n")
#' @param m2 Number of forecast categories (only required if both obsv.type and
#' fcst.type equal "m"). The number of observation categories is then specified
#' by the argument \emph{m} above.
#' @param na.rm logical; if \code{TRUE} pairs where \code{obsv} or
#'   \code{fcst} is \code{NA} are removed before scoring. Default
#'   \code{FALSE} returns \code{NA} if any input contains \code{NA}.
#' @return \item{ p.afc }{ Value of Generalized Discrimination Score (2AFC) }
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology,
#' MeteoSwiss, Zurich, Switzerland
#' @seealso \code{\link{afc.dd}} \code{\link{afc.dm}} \code{\link{afc.dp}}
#' \code{\link{afc.dc}} \code{\link{afc.de}} \code{\link{afc.mm}}
#' \code{\link{afc.mp}} \code{\link{afc.mc}} \code{\link{afc.me}}
#' \code{\link{afc.nn}} \code{\link{afc.np}} \code{\link{afc.cc}}
#' \code{\link{afc.ce}}
#' @references S.J. Mason and A.P. Weigel, 2009. A generic verification
#' framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
#' @keywords file
#' @examples
#'   data(cnrm.nino34.dd)
#'   obsv = cnrm.nino34.dd$obsv
#'   fcst = cnrm.nino34.dd$fcst
#'   afc(obsv, fcst, obsv.type="d", fcst.type="d")
#'
#'   data(cnrm.nino34.dm)
#'   obsv = cnrm.nino34.dm$obsv
#'   fcst = cnrm.nino34.dm$fcst
#'   afc(obsv, fcst, obsv.type="d", fcst.type="m", m=4)
#'
#'   data(cnrm.nino34.dp)
#'   obsv = cnrm.nino34.dp$obsv
#'   fcst = cnrm.nino34.dp$fcst
#'   afc(obsv, fcst, obsv.type="d", fcst.type="p")
#'
#'   data(cnrm.nino34.dc)
#'   obsv = cnrm.nino34.dc$obsv
#'   fcst = cnrm.nino34.dc$fcst
#'   afc(obsv, fcst, obsv.type="d", fcst.type="c")
#'
#'   data(cnrm.nino34.de)
#'   obsv = cnrm.nino34.de$obsv
#'   fcst = cnrm.nino34.de$fcst
#'   afc(obsv, fcst, obsv.type="d", fcst.type="e")
#'
#'   data(cnrm.nino34.mm)
#'   obsv = cnrm.nino34.mm$obsv
#'   fcst = cnrm.nino34.mm$fcst
#'   afc(obsv, fcst, obsv.type="m", fcst.type="m", m=4, m2=4)
#'
#'   data(cnrm.nino34.mp)
#'   obsv = cnrm.nino34.mp$obsv
#'   fcst = cnrm.nino34.mp$fcst
#'   afc(obsv, fcst, obsv.type="m", fcst.type="p", m=4)
#'
#'   data(cnrm.nino34.mc)
#'   obsv = cnrm.nino34.mc$obsv
#'   fcst = cnrm.nino34.mc$fcst
#'   afc(obsv, fcst, obsv.type="m", fcst.type="c", m=4)
#'
#'   data(cnrm.nino34.me)
#'   obsv = cnrm.nino34.me$obsv
#'   fcst = cnrm.nino34.me$fcst
#'   afc(obsv, fcst, obsv.type="m", fcst.type="e", m=4)
#'
#'   data(cnrm.nino34.mm)
#'   obsv = cnrm.nino34.mm$obsv
#'   fcst = cnrm.nino34.mm$fcst
#'   afc(obsv, fcst, obsv.type="n", fcst.type="n", m=4)
#'
#'   data(cnrm.nino34.mp)
#'   obsv = cnrm.nino34.mp$obsv
#'   fcst = cnrm.nino34.mp$fcst
#'   afc(obsv, fcst, obsv.type="n", fcst.type="p", m=4)
#'
#'   data(cnrm.nino34.cc)
#'   obsv = cnrm.nino34.cc$obsv
#'   fcst = cnrm.nino34.cc$fcst
#'   afc(obsv, fcst, obsv.type="c", fcst.type="c")
#'
#'   data(cnrm.nino34.ce)
#'   obsv = cnrm.nino34.ce$obsv
#'   fcst = cnrm.nino34.ce$fcst
#'   afc(obsv, fcst, obsv.type="c", fcst.type="e")
#' @export afc
afc = function(obsv,fcst,obsv.type,fcst.type,m=0,m2=0,na.rm=FALSE){

  if (na.rm) {
    d <- .complete_cases(obsv, fcst); obsv <- d$obsv; fcst <- d$fcst
  }

  type.ok.flag = 0

  if (obsv.type == "d" & fcst.type == "d"){
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if (length(which(obsv != 0 & obsv != 1)) > 0)
      stop("observations can only have values 1 and 0")
    if (length(which(fcst != 0 & fcst != 1)) > 0)
      stop("forecasts can only have values 1 and 0")
    afc.score = afc.dd(obsv,fcst,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "d" & fcst.type == "m"){
    if (m == 0) stop("number of forecast categories missing")
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if (length(which(obsv != 0 & obsv != 1)) > 0)
      stop("observations can only have values 1 and 0")
    if (length(which(!(fcst %in% 1:m))) > 0)
      stop("forecasts can only have values [1,2,...,m]")
    afc.score = afc.dm(obsv,fcst,m,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "d" & fcst.type == "p"){
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if (length(which(obsv != 0 & obsv != 1)) > 0)
      stop("observations can only have values 1 and 0")
    if (length(which(fcst < 0 | fcst > 1)) > 0)
      stop("forecasts must be probabilities, i.e. values between 0 and 1")
    afc.score = afc.dp(obsv,fcst,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "d" & fcst.type == "c"){
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if (length(which(obsv != 0 & obsv != 1)) > 0)
      stop("observations can only have values 1 and 0")
    afc.score = afc.dc(obsv,fcst,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "d" & fcst.type == "e"){
    if (length(dim(obsv)) > 0)
      stop("observations must be a vector")
    if (length(which(obsv != 0 & obsv != 1)) > 0)
      stop("observations can only have values 0 and 1")
    if (length(dim(fcst)) != 2)
      stop("forecasts must be array with dimensions length(obsv) x ens.size")
    if (dim(fcst)[1] != length(obsv))
      stop("number of forecasts must be equal to number of observations")
    afc.score = afc.de(obsv,fcst,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "m" & fcst.type == "m"){
    if (m == 0 | m2 == 0) stop("Please enter number of BOTH observation and forecast categories")
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if (length(which(!(obsv %in% 1:m))) > 0)
      stop("observations can only have values [1,2,...,mv]")
    if (length(which(!(obsv %in% 1:m2))) > 0)
      stop("forecasts can only have values [1,2,...,mf]")
    afc.score = afc.mm(obsv,fcst,m,m2,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "n" & fcst.type == "n"){
    if (m == 0) stop("Please enter number of categories")
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if ( (length(which(!(obsv %in% 1:m))) > 0) | (length(which(!(fcst %in% 1:m))) > 0) )
      stop("observations/forecasts can only have values [1,2,...,m]")
    afc.score = afc.nn(obsv,fcst,m,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "m" & fcst.type == "p"){
    if (m == 0) stop("Please enter number of observation categories")
    if (length(dim(obsv)) > 0 )
      stop("observations must be vector")
    if (length(dim(fcst)) != 2)
      stop("forecasts must be array with dimensions length(obsv) x m")
    if (dim(fcst)[1] != length(obsv))
      stop("number of forecasts must be equal to number of observations")
    if (dim(fcst)[2] != m)
      stop("Probabilities must be assigned to each category")
    if (length(which(fcst < 0 | fcst > 1)) > 0)
      stop("forecasts must be probabilities, i.e. values between 0 and 1")
    if (length(which(!(obsv %in% 1:m))) > 0)
      stop("observations can only have values [1,2,...,m]")
    afc.score = afc.mp(obsv,fcst,m,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "n" & fcst.type == "p"){
    if (m == 0) stop("Please enter number of observation categories")
    if (length(dim(obsv)) > 0)
      stop("observations must be vector")
    if (length(dim(fcst)) != 2)
      stop("forecasts must be array with dimensions length(obsv) x m")
    if (dim(fcst)[1] != length(obsv))
      stop("number of forecasts must be equal to number of observations")
    if (dim(fcst)[2] != m)
      stop("Probabilities must be assigned to each category")
    if (length(which(fcst < 0 | fcst > 1)) > 0)
      stop("forecasts must be probabilities, i.e. values between 0 and 1")
    if (length(which(!(obsv %in% 1:m))) > 0)
      stop("observations can only have values [1,2,...,m]")
    afc.score = afc.np(obsv,fcst,m,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "m" & fcst.type == "c"){
    if (m == 0) stop("Please enter number of categories")
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    if (length(which(!(obsv %in% 1:m))) > 0)
      stop("observations can only have values [1,2,...,m]")
    afc.score = afc.mc(obsv,fcst,m,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "m" & fcst.type == "e"){
    if (m == 0) stop("Please enter number of categories")
    if (length(dim(obsv)) > 0)
      stop("observations must be vector")
    if (length(which(!(obsv %in% 1:m))) > 0)
      stop("observations can only have values [1,2,...,m]")
    if (length(dim(fcst)) != 2)
      stop("forecasts must be array with dimensions length(obsv) x ens.size")
    if (dim(fcst)[1] != length(obsv))
      stop("number of forecasts must be equal to number of observations")
    afc.score = afc.me(obsv,fcst,m,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "c" & fcst.type == "c"){
    if (length(dim(obsv)) > 0 | length(dim(fcst)) > 0)
      stop("observations / forecasts must be vectors")
    if (length(obsv) != length(fcst))
      stop("observations and forecasts must have same length")
    afc.score = afc.cc(obsv,fcst,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (obsv.type == "c" & fcst.type == "e"){
    if (length(dim(obsv)) > 0)
      stop("observations must be a vector")
    if (length(dim(fcst)) != 2)
      stop("forecasts must be array with dimensions length(obsv) x ens.size")
    if (dim(fcst)[1] != length(obsv))
      stop("number of forecasts must be equal to number of observations")
    afc.score = afc.ce(obsv,fcst,na.rm=na.rm)
    type.ok.flag = 1
  }

  if (type.ok.flag == 0) stop("invalid combination of obsv.type and fcst.type")

  return(afc.score)

}
