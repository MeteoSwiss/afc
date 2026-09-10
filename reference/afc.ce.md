# 2AFC For Continuous Observations And Ensemble Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of
continuous observations and ensemble forecasts

## Usage

``` r
afc.ce(obsv, fcst, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with real-valued observations

- fcst:

  two-dimensional array with ensemble forecasts; dim(fcst)\[1\] =
  length(obsv); dim(fcst)\[2\] = ensemble size

- na.rm:

  logical; if `TRUE` pairs where `obsv` or `fcst` is `NA` are removed
  before scoring. Default `FALSE` returns `NA` if any input contains
  `NA`.

## Value

- p.afc :

  Value of Generalized Discrimination (2AFC) Score

## Details

This routine applies Eq.24 of Mason and Weigel (2009) to calculate the
2AFC.

## References

S.J. Mason and A.P. Weigel, 2009. A generic verification framework for
administrative purposes. Mon. Wea. Rev., 137, 331-349

## See also

[`afc`](https://meteoswiss.github.io/afc/reference/afc.md)

## Author

Andreas Weigel, Federal Office of Meteorology and Climatology,
MeteoSwiss, Zurich, Switzerland

## Examples

``` r
  data(cnrm.nino34.ce)
  obsv = cnrm.nino34.ce$obsv
  fcst = cnrm.nino34.ce$fcst
  afc.ce(obsv,fcst)
#> [1] 0.8735561
```
