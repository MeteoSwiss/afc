# 2AFC For Ordinal Polychotomous Observations And Ensemble Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of
polychotomous observations (ordinal) and ensemble forecasts

## Usage

``` r
afc.me(obsv, fcst, m = 3, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with polychotomous observations (values in {1,..,m})

- fcst:

  two-dimensional array with ensemble forecasts; dim(fcst)\[1\] =
  length(obsv); dim(fcst)\[2\] = ensemble size

- m:

  number of observation categories (default = 3)

- na.rm:

  logical; if `TRUE` pairs where `obsv` or `fcst` is `NA` are removed
  before scoring. Default `FALSE` returns `NA` if any input contains
  `NA`.

## Value

- p.afc :

  Value of Generalized Discrimination (2AFC) Score

## Details

This routine first ranks the ensemble forecasts (see
[`rank.ensembles`](https://meteoswiss.github.io/afc/reference/rank.ensembles.md))
and then calculates the 2AFC-score with Eq.18 of Mason and Weigel
(2009).

## References

S.J. Mason and A.P. Weigel, 2009. A generic verification framework for
administrative purposes. Mon. Wea. Rev., 137, 331-349

## See also

[`afc`](https://meteoswiss.github.io/afc/reference/afc.md)
[`rank.ensembles`](https://meteoswiss.github.io/afc/reference/rank.ensembles.md)

## Author

Andreas Weigel, Federal Office of Meteorology and Climatology,
MeteoSwiss, Zurich, Switzerland

## Examples

``` r
  data(cnrm.nino34.me)
  obsv = cnrm.nino34.me$obsv
  fcst = cnrm.nino34.me$fcst
  afc.me(obsv,fcst,4)
#> [1] 0.9261863
```
