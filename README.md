
<!-- README.md is generated from README.Rmd. Please edit that file -->

# afc

<!-- badges: start -->

[![R-CMD-check](https://github.com/MeteoSwiss/afc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MeteoSwiss/afc/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/afc)](https://CRAN.R-project.org/package=afc)
<!-- badges: end -->

Compute the Generalized Discrimination Score for various types of
forecasts and observations.

## Installation

You can install the development version of afc from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("MeteoSwiss/afc")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(afc)
data(cnrm.nino34.cc)
afc.cc(cnrm.nino34.cc$obsv,cnrm.nino34.cc$fcst)
#> [1] 0.8717949
```
