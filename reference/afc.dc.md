# 2AFC For Dichotomous Observations And Continuous Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of
dichotomous observations and continuous forecasts

## Usage

``` r
afc.dc(obsv, fcst, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with dichotomous observations (values in {0,1})

- fcst:

  vector of same length as *obsv* with real-valued forecasts

- na.rm:

  logical; if `TRUE` pairs where `obsv` or `fcst` is `NA` are removed
  before scoring. Default `FALSE` returns `NA` if any input contains
  `NA`.

## Value

- p.afc :

  Value of Generalized Discrimination (2AFC) Score

## Details

This routine applies Eq.4 of Mason and Weigel (2009) to calculate the
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
  data(cnrm.nino34.dc)
  obsv = cnrm.nino34.dc$obsv
  fcst = cnrm.nino34.dc$fcst
  afc.dc(obsv,fcst)
#> [1] 0.9893333
```
