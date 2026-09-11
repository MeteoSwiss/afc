# 2AFC For Nominal Polychotomous Observations And Nominal Polychotomous Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of nominal
polychotomous observations and polychotomous forecasts (nominal)

## Usage

``` r
afc.nn(obsv, fcst, m = 3, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with polychotomous observations (values in {1,..,m})

- fcst:

  vector of same length as *obsv* with polychotomous forecasts (values
  in {1,..,m})

- m:

  number of observation and forecast categories (default = 3)

- na.rm:

  logical; if `TRUE` pairs where `obsv` or `fcst` is `NA` are removed
  before scoring. Default `FALSE` returns `NA` if any input contains
  `NA`.

## Value

- p.afc :

  Value of Generalized Discrimination (2AFC) Score

## Details

This routine applies Eq.15 of Mason and Weigel (2009) to calculate the
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
  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst
  afc.nn(obsv,fcst,4)
#> [1] 0.8049209
```
