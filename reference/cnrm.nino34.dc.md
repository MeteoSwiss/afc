# Example Data of Dichotomous Observations and Continuous Forecasts

Dichotomous observations (obsv) and continuous forecasts (fcst) of the
Nino-3.4 index for January 1961-2000. The forecast data stem from model
runs initialized using data for the preceding August 1960-1999.
Definition of an "event" in the observations: obsv \>= 27 C.

## Format

A data frame with 40 rows and 3 columns:

- years:

  integer, year of observation (1961-2000)

- obsv:

  integer, dichotomous observations (0/1; event defined as Nino-3.4
  index \>= 27 C)

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
