

#' Generalized Discrimination Score 2AFC
#'
#' This package is a collection of routines to calculate the "generalized
#' discrimination score", which is also known as "two alternatives
#' forced-choice score" or short: "2AFC-score". The 2AFC is a generic forecast
#' verification framework which can be applied to any of the following
#' verification contexts: dichotomous, polychotomous (ordinal and nominal),
#' continuous, probabilistic, and ensemble. A comprehensive description of the
#' 2AFC-score, including all equations used in this package, is provided by
#' Mason and Weigel (2009).
#'
#' The master routine is \code{\link{afc}}. For a given set of observation and
#' forecast data, and for a specified verification context, \code{\link{afc}}
#' calls the appropriate functions which are necessary to calculate the 2AFC
#' score.
#'
#' Why the 2AFC-score? There are numerous reasons for calculating forecast
#' verification scores, and considerable attention has been given to designing
#' and analyzing the properties of scores that can be used for scientific
#' purposes. Much less attention has been given to scores that may be useful
#' for administrative reasons, such as communicating changes in forecast
#' quality to bureaucrats, and providing indications of forecast quality to the
#' general public. The 2AFC test a scoring procedure that is sufficiently
#' generic to be useable on forecasts ranging from simply "yes"/"no" forecasts
#' of dichotomous outcomes to continuous variables, and can be used with
#' deterministic or probabilistic forecasts without seriously reducing the more
#' complex information when available. Although, as with any single
#' verification score, the 2AFC has limitations, it does have broad intuitive
#' appeal in that the expected score of an unskilled set of forecasts (random
#' guessing or perpetually identical forecasts) is 50\%, and is interpretable
#' as an indication of how often the forecasts are correct, even when the
#' forecasts are expressed probabilistically and/or the observations are not
#' discrete.
#'
#' \tabular{ll}{ Package: \tab afc\cr Version: \tab 1.03\cr Date: \tab
#' 2010-01-07\cr License: \tab GPL-2\cr }
#'
#' @section Index:
#' \preformatted{
#' afc                     Calculate Generalized Discrimination Score 2AFC
#' afc-package             Generalized Discrimination Score 2AFC
#' afc.cc                  2AFC For Continuous Observations And Continuous
#'                         Forecasts
#' afc.ce                  2AFC For Ordinal Polychotomous Observations And
#'                         Ensemble Forecasts
#' afc.dc                  2AFC For Dichotomous Observations And
#'                         Continuous Forecasts
#' afc.dd                  2AFC For Dichotomous Observations And
#'                         Dichotomous Forecasts
#' afc.de                  2AFC for Dichotomous Observations and Ensemble
#'                         Forecasts
#' afc.dm                  2AFC For Dichotomous Observations And
#'                         Polychotomous Forecasts
#' afc.dp                  2AFC For Dichotomous Observations And
#'                         Probabilistic Forecasts
#' afc.mc                  2AFC For Ordinal Polychotomous Observations And
#'                         Continuous Forecasts
#' afc.me                  2AFC For Ordinal Polychotomous Observations And
#'                         Ensemble Forecasts
#' afc.mm                  2AFC For Ordinal Polychotomous Observations And
#'                         Ordinal Polychotomous Forecasts
#' afc.mp                  2AFC For Ordinal Polychotomous Observations And
#'                         Probabilistic Forecasts
#' afc.nn                  2AFC For Nominal Polychotomous Observations And
#'                         Nominal Polychotomous Forecasts
#' afc.np                  2AFC For Nominal Polychotomous Observations And
#'                         Probabilistic Forecasts
#' cnrm.nino34.cc          Example Data of Continuous Observations and
#'                         Continuous Forecasts
#' cnrm.nino34.ce          Example Data of Continuous Observations and
#'                         Ensemble Forecasts
#' cnrm.nino34.dc          Example Data of Dichotomous Observations and
#'                         Continuous Forecasts
#' cnrm.nino34.dd          Example Data of Dichotomous Observations and
#'                         Dichotomous Forecasts
#' cnrm.nino34.de          Example Data of Dichotomous Observations and
#'                         Ensemble Forecasts
#' cnrm.nino34.dm          Example Data of Dichotomous Observations and
#'                         Polychotomous Forecasts
#' cnrm.nino34.dp          Example Data of Dichotomous Observations and
#'                         Polychotomous Forecasts
#' cnrm.nino34.mc          Example Data of Polychotomous Observations and
#'                         Continuous Forecasts
#' cnrm.nino34.me          Example Data of Polychotomous Observations and
#'                         Ensembles Forecasts
#' cnrm.nino34.mm          Example Data of Polychotomous Observations and
#'                         Polychotomous Forecasts
#' cnrm.nino34.mp          Example Data of Polychotomous Observations and
#'                         Probabilistic Forecasts
#' rank.ensembles          Rank Ensembles
#' }
#'
#' @name afc-package
#' @docType package
#' @author Andreas Weigel, Federal Office of Meteorology and Climatology
#' (MeteoSwiss), Zurich, Switzerland <andreas.weigel@@meteoswiss.ch>
#' @references Mason, S.J. and A.P. Weigel, 2009: A generic forecast
#' verification framework for administrative purposes. Mon. Wea. Rev., 137,
#' 331-349
#' @keywords package
NULL





#' Example Data of Continuous Observations and Continuous Forecasts
#'
#' Continuous observations (obsv) and continuous forecasts (fcst) of the
#' Nino-3.4 index for January 1961-2000. The forecast data stem from model runs
#' initialized using data for the preceding August 1960-1999.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.cc
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{numeric, continuous observations of Nino-3.4 index (degrees C)}
#'   \item{fcst}{numeric, continuous forecasts of Nino-3.4 index (degrees C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Continuous Observations and Ensemble Forecasts
#'
#' Continuous observations (obsv) and 9-member ensemble forecasts (fcst) of the
#' Nino-3.4 index for January 1961-2000. The forecast data stem from model runs
#' initialized using data for the preceding August 1960-1999.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.ce
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{numeric, continuous observations of Nino-3.4 index (degrees C)}
#'   \item{fcst}{numeric matrix [40 x 9], 9-member ensemble forecasts
#'     of Nino-3.4 index (degrees C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Dichotomous Observations and Continuous Forecasts
#'
#' Dichotomous observations (obsv) and continuous forecasts (fcst) of the
#' Nino-3.4 index for January 1961-2000. The forecast data stem from model runs
#' initialized using data for the preceding August 1960-1999. Definition of an
#' "event" in the observations: obsv >= 27 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.dc
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, dichotomous observations
#'     (0/1; event defined as Nino-3.4 index >= 27 C)}
#'   \item{fcst}{numeric, continuous forecasts of Nino-3.4 index (degrees C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Dichotomous Observations and Dichotomous Forecasts
#'
#' Dichotomous observations (obsv) and dichotomous forecasts (fcst) of the
#' Nino-3.4 index for January 1961-2000. The forecast data stem from model runs
#' initialized using data for the preceding August 1960-1999. Definition of an
#' "event" in the observations respectively forecasts: obsv/fcst >= 27 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.dd
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, dichotomous observations
#'     (0/1; event defined as Nino-3.4 index >= 27 C)}
#'   \item{fcst}{integer, dichotomous forecasts
#'     (0/1; event defined as Nino-3.4 index >= 27 C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Dichotomous Observations and Ensemble Forecasts
#'
#' Dichotomous observations (obsv) and 9-member ensemble forecasts (fcst) of
#' the Nino-3.4 index for January 1961-2000. The forecast data stem from model
#' runs initialized using data for the preceding August 1960-1999.  Definition
#' of an "event" in the observations: obsv >= 27 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.de
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, dichotomous observations
#'     (0/1; event defined as Nino-3.4 index >= 27 C)}
#'   \item{fcst}{numeric matrix [40 x 9], 9-member ensemble forecasts
#'     of Nino-3.4 index (degrees C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Dichotomous Observations and Polychotomous Forecasts
#'
#' Dichotomous observations (obsv) and polychotomous forecasts with four
#' categories (fcst) of the Nino-3.4 index for January 1961-2000. The forecast
#' data stem from model runs initialized using data for the preceding August
#' 1960-1999. Definition of an "event" in the observations: obsv >= 27 C.
#' Definition of the four forecast "categories": (1) fcst < 26 C; (2) fcst in
#' [26 C,27 C[; (3) fcst in [27 C,28 C[; (4) fcst >= 28 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.dm
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, dichotomous observations
#'     (0/1; event defined as Nino-3.4 index >= 27 C)}
#'   \item{fcst}{integer, polychotomous forecasts
#'     (categories 1-4; (1) < 26 C; (2) 26-27 C; (3) 27-28 C; (4) >= 28 C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Dichotomous Observations and Probabilistic Forecasts
#'
#' Dichotomous observations (obsv) and discrete probabilistic forecasts (fcst)
#' of the Nino-3.4 index for January 1961-2000. The forecast data stem from
#' model runs initialized using data for the preceding August 1960-1999.
#' Definition of an "event" in the observations: obsv >= 27 C. The
#' probabilistic forecasts have been estimated by taking the fraction of
#' ensemble members predicting the event.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.dp
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, dichotomous observations
#'     (0/1; event defined as Nino-3.4 index >= 27 C)}
#'   \item{fcst}{numeric, probabilistic forecasts (fraction of ensemble
#'     members predicting the event, values in [0, 1])}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Polychotomous Observations and Continuous Forecasts
#'
#' Polychotomous observations with four categories (obsv) and continuous
#' forecasts (fcst) of the Nino-3.4 index for January 1961-2000. The forecast
#' data stem from model runs initialized using data for the preceding August
#' 1960-1999. Definition of the four observation "categories": (1) obsv < 26 C;
#' (2) obsv in [26 C,27 C[; (3) obsv in [27 C,28 C[; (4) obsv >= 28 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.mc
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, polychotomous observations
#'     (categories 1-4; (1) < 26 C; (2) 26-27 C; (3) 27-28 C; (4) >= 28 C)}
#'   \item{fcst}{numeric, continuous forecasts of Nino-3.4 index (degrees C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Polychotomous Observations and Ensembles Forecasts
#'
#' Polychotomous observations with four categories (obsv) and 9-member ensemble
#' forecasts (fcst) of the Nino-3.4 index for January 1961-2000. The forecast
#' data stem from model runs initialized using data for the preceding August
#' 1960-1999. Definition of the four observation "categories": (1) obsv < 26 C;
#' (2) obsv in [26 C,27 C[; (3) obsv in [27 C,28 C[; (4) obsv >= 28 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.me
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, polychotomous observations
#'     (categories 1-4; (1) < 26 C; (2) 26-27 C; (3) 27-28 C; (4) >= 28 C)}
#'   \item{fcst}{numeric matrix [40 x 9], 9-member ensemble forecasts
#'     of Nino-3.4 index (degrees C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Polychotomous Observations and Polychotomous Forecasts
#'
#' Polychotomous observations with four categories (obsv) and polychotomous
#' forecasts with four categories (fcst) of the Nino-3.4 index for January
#' 1961-2000. The forecast data stem from model runs initialized using data for
#' the preceding August 1960-1999. Definition of the four observation
#' respectively forecast "categories": (1) obsv/fcst < 26 C; (2) obsv/fcst in
#' [26 C,27 C[; (3) obsv/fcst in [27 C,28 C[; (4) obsv >= 28 C.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.mm
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, polychotomous observations
#'     (categories 1-4; (1) < 26 C; (2) 26-27 C; (3) 27-28 C; (4) >= 28 C)}
#'   \item{fcst}{integer, polychotomous forecasts
#'     (categories 1-4; (1) < 26 C; (2) 26-27 C; (3) 27-28 C; (4) >= 28 C)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL





#' Example Data of Polychotomous Observations and Probabilistic Forecasts
#'
#' Polychotomous observations with four categories (obsv) and discrete
#' probabilistic forecasts (fcst) of the Nino-3.4 index for January 1961-2000.
#' The forecast data stem from model runs initialized using data for the
#' preceding August 1960-1999. Definition of the four observation "categories":
#' (1) obsv < 26 C; (2) obsv in [26 C,27 C[; (3) obsv in [27 C,28 C[; (4) obsv
#' >= 28 C. The probabilistic forecasts have been estimated by taking the
#' fraction of ensemble members falling into each of the four categories.
#'
#' The forecast data are from the coupled ocean-atmosphere model of the Centre
#' National de Recherches Meteorologiques (CNRM) of Meteo France and were
#' generated as part of the "Development of a European Multimodel Ensemble
#' System for Seasonal to Interannual Prediction (DEMETER)" project (Palmer et
#' al. 2004). Note that also the examples presented in the 2AFC paper by Mason
#' and Weigel (2009) are based on these data.
#'
#' @name cnrm.nino34.mp
#' @docType data
#' @format A data frame with 40 rows and 3 columns:
#' \describe{
#'   \item{years}{integer, year of observation (1961-2000)}
#'   \item{obsv}{integer, polychotomous observations
#'     (categories 1-4; (1) < 26 C; (2) 26-27 C; (3) 27-28 C; (4) >= 28 C)}
#'   \item{fcst}{numeric matrix [40 x 4], probabilistic forecasts
#'     (fraction of ensemble members in each of the 4 categories)}
#' }
#' @references Palmer, T.N. and Coauthors, 2004: Development of a European
#' ensemble system for seasonal to inter-annual prediction (DEMETER). Bull.
#' Amer. Meteor. Soc., 85, 853-872. \cr Mason, S.J. and A.P. Weigel, 2009: A
#' generic forecast verification framework for administrative purposes. Mon.
#' Wea. Rev., 137, 331-349
#' @keywords datasets
NULL
