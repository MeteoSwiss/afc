# Calculate Generalized Discrimination Score 2AFC

This is the master routine for the calculation the Generalized
Discrimination Score (aka Two-Alternatives Forced Choice Score - 2AFC)
as described in the Paper of Mason and Weigel (2009). This routine
requires, as input, datasets of forecasts and corresponding
observations, as well as a specification of the verification context.
The routine checks whether the input data are consistent with the
verification context, then calls the appropriate function to calculate
the 2AFC, and finally returns the 2AFC skill value.

## Usage

``` r
afc(obsv, fcst, obsv.type, fcst.type, m = 0, m2 = 0, na.rm = FALSE)
```

## Arguments

- obsv:

  Vector of observations. The required format depends on the specific
  verification context. More details below.

- fcst:

  Vector or two-dimensional array of forecasts. The required format
  depends on the specific verification context. More details below.

- obsv.type:

  Character specifying the type of the observations. Possible values:
  "d" (dichotomous), "m" (polychotomous with ordinal categories), "n"
  (polychotomous with nominal categories), "c" (continuous).

- fcst.type:

  Character specifying the type of the forecasts. Possible values: "d"
  (dichotomous), "m" (polychotomous with ordinal categories), "n"
  (polychotomous with nominal categories), "p" (probabilistic), "c"
  (continuous) and "e" (ensemble).

- m:

  Number of observation or forecast categories (only required if
  obsv.type or fcst.type equals "m" or "n")

- m2:

  Number of forecast categories (only required if both obsv.type and
  fcst.type equal "m"). The number of observation categories is then
  specified by the argument *m* above.

- na.rm:

  logical; if `TRUE` pairs where `obsv` or `fcst` is `NA` are removed
  before scoring. Default `FALSE` returns `NA` if any input contains
  `NA`.

## Value

- p.afc :

  Value of Generalized Discrimination Score (2AFC)

## Details

Depending on the specific verification context (i.e. the choice for
*obsv.type* and *fcst.type*), this routine calls the appropriate
function(s) to calculate the 2AFC score. The following combinations of
*obsv.type* and *fcst.type* are possible: (1) "d-d"; (2) "d-m"; (3)
"d-p"; (4) "d-c"; (5) "d-e"; (6) "m-m"; (7) "m-p"; (8) "m-c"; (9) "m-e";
(10) "n-n"; (11) "n-p"; (12) "c-c"; (13) "c-e". The required format of
the input data *obsv* and *fcst* depends on the verification context:  

\(1\) "d-d":  
*obsv*: vector with dichotomous observations (values in 0,1)  
*fcst*: vector of same length as *obsv* with dichotomous forecasts
(values in 0,1)  

\(2\) "d-m":  
*obsv*: vector with dichotomous observations (values in 0,1)  
*fcst*: vector of same length as *obsv* with polychotomous forecasts
(values in 1,..,m)  

\(3\) "d-p":  
*obsv*: vector with dichotomous observations (values in 0,1)  
*fcst*: vector of same length as *obsv* with forecast probabilities for
the event to happen  

\(4\) "d-c":  
*obsv*: vector with dichotomous observations (values in 0,1)  
*fcst*: vector of same length as *obsv* with real-valued forecasts  

\(5\) "d-e":  
*obsv*: vector with dichotomous observations (values in 0,1)  
*fcst*: two-dimensional array with ensemble forecasts; dim(fcst)\[1\] =
length(obsv); dim(fcst)\[2\] = ensemble size.  

\(6\) "m-m":  
*obsv*: vector with polychotomous observations (values in 1,..,m)  
*fcst*: vector of same length as *obsv* with polychotomous forecasts
(values in 1,..,m2)  

\(7\) "m-p":  
*obsv*: vector with polychotomous observations (values in 1,..,m)  
*fcst*: two-dimensional array with forecast probabilities for the m
categories; dim(fcst)\[1\] = length(obsv); dim(fcst)\[2\] = m  

\(8\) "m-c":  
*obsv*: vector with polychotomous observations (values in 1,..,m)  
*fcst*: vector of same length as *obsv* with real-valued forecasts  

\(9\) "m-e":  
*obsv*: vector with polychotomous observations (values in 1,..,m)  
*fcst*: two-dimensional array with ensemble forecasts; dim(fcst)\[1\] =
length(obsv); dim(fcst)\[2\] = ensemble size.  

\(10\) "n-n":  
*obsv*: vector with polychotomous observations (values in 1,..,m)  
*fcst*: vector of same length as *obsv* with polychotomous forecasts
(values in 1,..,m)  

\(11\) "n-p":  
Same as "m-p".  

\(12\) "c-c":  
*obsv*: vector with real-valued observations  
*fcst*: vector of same length as *obsv* with real-valued forecasts  

\(13\) "c-e":  
*obsv*: vector with real-valued observations  
*fcst*: two-dimensional array with ensemble forecasts; dim(fcst)\[1\] =
length(obsv); dim(fcst)\[2\] = ensemble size.  

## References

S.J. Mason and A.P. Weigel, 2009. A generic verification framework for
administrative purposes. Mon. Wea. Rev., 137, 331-349

## See also

[`afc.dd`](https://meteoswiss.github.io/afc/reference/afc.dd.md)
[`afc.dm`](https://meteoswiss.github.io/afc/reference/afc.dm.md)
[`afc.dp`](https://meteoswiss.github.io/afc/reference/afc.dp.md)
[`afc.dc`](https://meteoswiss.github.io/afc/reference/afc.dc.md)
[`afc.de`](https://meteoswiss.github.io/afc/reference/afc.de.md)
[`afc.mm`](https://meteoswiss.github.io/afc/reference/afc.mm.md)
[`afc.mp`](https://meteoswiss.github.io/afc/reference/afc.mp.md)
[`afc.mc`](https://meteoswiss.github.io/afc/reference/afc.mc.md)
[`afc.me`](https://meteoswiss.github.io/afc/reference/afc.me.md)
[`afc.nn`](https://meteoswiss.github.io/afc/reference/afc.nn.md)
[`afc.np`](https://meteoswiss.github.io/afc/reference/afc.np.md)
[`afc.cc`](https://meteoswiss.github.io/afc/reference/afc.cc.md)
[`afc.ce`](https://meteoswiss.github.io/afc/reference/afc.ce.md)

## Author

Andreas Weigel, Federal Office of Meteorology and Climatology,
MeteoSwiss, Zurich, Switzerland

## Examples

``` r
  data(cnrm.nino34.dd)
  obsv = cnrm.nino34.dd$obsv
  fcst = cnrm.nino34.dd$fcst
  afc(obsv, fcst, obsv.type="d", fcst.type="d")
#> [1] 0.9266667

  data(cnrm.nino34.dm)
  obsv = cnrm.nino34.dm$obsv
  fcst = cnrm.nino34.dm$fcst
  afc(obsv, fcst, obsv.type="d", fcst.type="m", m=4)
#> [1] 0.952

  data(cnrm.nino34.dp)
  obsv = cnrm.nino34.dp$obsv
  fcst = cnrm.nino34.dp$fcst
  afc(obsv, fcst, obsv.type="d", fcst.type="p")
#> [1] 0.9826667

  data(cnrm.nino34.dc)
  obsv = cnrm.nino34.dc$obsv
  fcst = cnrm.nino34.dc$fcst
  afc(obsv, fcst, obsv.type="d", fcst.type="c")
#> [1] 0.9893333

  data(cnrm.nino34.de)
  obsv = cnrm.nino34.de$obsv
  fcst = cnrm.nino34.de$fcst
  afc(obsv, fcst, obsv.type="d", fcst.type="e")
#> [1] 0.984

  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst
  afc(obsv, fcst, obsv.type="m", fcst.type="m", m=4, m2=4)
#> [1] 0.9024605

  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst
  afc(obsv, fcst, obsv.type="m", fcst.type="p", m=4)
#> [1] 0.9200351

  data(cnrm.nino34.mc)
  obsv = cnrm.nino34.mc$obsv
  fcst = cnrm.nino34.mc$fcst
  afc(obsv, fcst, obsv.type="m", fcst.type="c", m=4)
#> [1] 0.9191564

  data(cnrm.nino34.me)
  obsv = cnrm.nino34.me$obsv
  fcst = cnrm.nino34.me$fcst
  afc(obsv, fcst, obsv.type="m", fcst.type="e", m=4)
#> [1] 0.9261863

  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst
  afc(obsv, fcst, obsv.type="n", fcst.type="n", m=4)
#> [1] 0.8049209

  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst
  afc(obsv, fcst, obsv.type="n", fcst.type="p", m=4)
#> [1] 0.8580844

  data(cnrm.nino34.cc)
  obsv = cnrm.nino34.cc$obsv
  fcst = cnrm.nino34.cc$fcst
  afc(obsv, fcst, obsv.type="c", fcst.type="c")
#> [1] 0.8717949

  data(cnrm.nino34.ce)
  obsv = cnrm.nino34.ce$obsv
  fcst = cnrm.nino34.ce$fcst
  afc(obsv, fcst, obsv.type="c", fcst.type="e")
#> [1] 0.8735561
```
