# Example Data of Polychotomous Observations and Continuous Forecasts

Polychotomous observations with four categories (obsv) and continuous
forecasts (fcst) of the Nino-3.4 index for January 1961-2000. The
forecast data stem from model runs initialized using data for the
preceding August 1960-1999. Definition of the four observation
"categories": (1) obsv \< 26 C; (2) obsv in \[26 C,27 C\[; (3) obsv in
\[27 C,28 C\[; (4) obsv \>= 28 C.

## Format

A data frame with 40 rows and 3 columns:

- years:

  integer, year of observation (1961-2000)

- obsv:

  integer, polychotomous observations (categories 1-4; (1) \< 26 C; (2)
  26-27 C; (3) 27-28 C; (4) \>= 28 C)

- fcst:

  numeric, continuous forecasts of Nino-3.4 index (degrees C)

## Details

The forecast data are from the coupled ocean-atmosphere model of the
Centre National de Recherches Meteorologiques (CNRM) of Meteo France and
were generated as part of the "Development of a European Multimodel
Ensemble System for Seasonal to Interannual Prediction (DEMETER)"
project (Palmer et al. 2004). Note that also the examples presented in
the 2AFC paper by Mason and Weigel (2009) are based on these data.

## References

Palmer, T.N. and Coauthors, 2004: Development of a European ensemble
system for seasonal to inter-annual prediction (DEMETER). Bull. Amer.
Meteor. Soc., 85, 853-872.  
Mason, S.J. and A.P. Weigel, 2009: A generic forecast verification
framework for administrative purposes. Mon. Wea. Rev., 137, 331-349
