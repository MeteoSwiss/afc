# 2AFC For Nominal Polychotomous Observations And Probabilistic Forecasts

Routine to calculate the Generalized Discrimination Score (aka
Two-Alternatives Forced Choice Score 2AFC) for the situation of
polychotomous (nominal) observations and discrete probabilistic
forecasts

## Usage

``` r
afc.np(obsv, fcst, m = 3, na.rm = FALSE)
```

## Arguments

- obsv:

  vector with polychotomous observations (values in 1,..,m)

- fcst:

  two-dimensional array with forecast probabilities for the m
  categories; dim(fcst)\[1\] = length(obsv); dim(fcst)\[2\] = m

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

This routine applies Eq.17 of Mason and Weigel (2009) to calculate the
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
  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst
  afc.np(obsv,fcst,4)
#> [1] 0.8580844
```
