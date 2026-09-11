# 2AFC For Ordinal Polychotomous Observations And Ordinal Polychotomous Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of
polychotomous observations (ordinal) and polychotomous forecasts
(ordinal)

## Usage

``` r
afc.mm(obsv, fcst, mv = 3, mf = 3, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with polychotomous observations (values in {1,..,mv})

- fcst:

  vector of same length as *obsv* with polychotomous forecasts (values
  in {1,..,mf})

- mv:

  number of observation categories (default = 3)

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

This routine applies Eq.14 of Mason and Weigel (2009) to calculate the
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
  afc.mm(obsv,fcst,4,4)
#> [1] 0.9024605
```
