# Rank Ensembles

Routine to rank a set of given ensemble forecasts according to their
"value"

## Usage

``` r
rank.ensembles(fcst)
```

## Arguments

- fcst:

  two-dimensional array with ensemble forecasts; dim(fcst)\[1\] = number
  of ensemble forecasts; dim(fcst)\[2\] = number of ensemble members

## Value

- ranks :

  vector with the ranks of the ensemble forecasts

## Details

This routine ranks a set of ensemble forecasts according to their
"value". The higher the "value" of an ensemble forecasts, the higher the
rank. The following principle is applied: Assume two ensembles A and B
are to be ranked. Without loss of generality, we define A\>B if the
probability of a random ensemble member of A being larger than a random
ensemble member of B exceeds 0.5. This probability is calculated by a
2AFC-like approach based on Eq. 8 of Mason and Weigel (2009). By
pairwise comparison of all ensembles, the final ranking is obtained.

## References

S.J. Mason and A.P. Weigel, 2009. A generic verification framework for
administrative purposes. Mon. Wea. Rev., 137, 331-349

## See also

[`afc.de`](https://meteoswiss.github.io/afc/reference/afc.de.md)
[`afc.me`](https://meteoswiss.github.io/afc/reference/afc.me.md)
[`afc.ce`](https://meteoswiss.github.io/afc/reference/afc.ce.md)
[`afc`](https://meteoswiss.github.io/afc/reference/afc.md)

## Author

Andreas Weigel, Federal Office of Meteorology and Climatology,
MeteoSwiss, Zurich, Switzerland

## Examples

``` r
  data(cnrm.nino34.ce)
  fcst = cnrm.nino34.ce$fcst
  rank.ensembles(fcst)
#>  [1] 19.0 12.0 21.0 34.0  6.0 37.0 17.0 11.0 31.5 24.0  3.0  8.0 39.0  2.0  9.0
#> [16]  4.0 32.5 28.0 18.0 25.0 23.0 13.0 38.0 16.0 15.0 22.0 35.0 32.0  1.0 10.0
#> [31] 27.0 36.0 27.0 28.0 30.0 14.0 20.0 40.0  7.0  5.0
```
