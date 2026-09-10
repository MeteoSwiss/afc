# 2AFC For Dichotomous Observations And Ordinal Polychotomous Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of
dichotomous observations and (ordinal) polychotomous forecasts

## Usage

``` r
afc.dm(obsv, fcst, mf = 3, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with dichotomous observations (values in 0,1)

- fcst:

  vector of same length as *obsv* with polychotomous forecasts (values
  in 1,..,m)

- mf:

  number of forecast categories (default = 3)

- na.rm:

  logical; if `TRUE` pairs where `obsv` or `fcst` is `NA` are removed
  before scoring. Default `FALSE` returns `NA` if any input contains
  `NA`.

## Value

- p.afc :

  Value of Generalized Discrimination (2AFC) Score

## Details

This routine applies Eq.5 of in Mason and Weigel (2009) to calculate the
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
  data(cnrm.nino34.dm)
  obsv = cnrm.nino34.dm$obsv
  fcst = cnrm.nino34.dm$fcst
  afc.dm(obsv,fcst,4)
#> [1] 0.952
```
