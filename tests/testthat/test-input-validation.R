# afc() must stop with informative errors for malformed inputs.
# Sub-functions are not tested here; validation lives in the dispatcher.

# ── invalid type combination ─────────────────────────────────────────────────

test_that("afc(): unknown obsv.type stops", {
  expect_error(afc(c(1, 2, 3), c(1, 2, 3), obsv.type = "x", fcst.type = "c"))
})

test_that("afc(): unknown fcst.type stops", {
  expect_error(afc(c(0, 1, 1), c(0, 1, 1), obsv.type = "d", fcst.type = "z"))
})

# ── dichotomous observations ─────────────────────────────────────────────────

test_that("afc(): non-0/1 observations with obsv.type='d' stops", {
  expect_error(
    afc(c(0, 2, 1), c(0, 1, 1), obsv.type = "d", fcst.type = "d"),
    "observations can only have values 1 and 0"
  )
})

test_that("afc(): non-0/1 forecasts with fcst.type='d' stops", {
  expect_error(
    afc(c(0, 0, 1), c(0, 2, 1), obsv.type = "d", fcst.type = "d"),
    "forecasts can only have values 1 and 0"
  )
})

test_that("afc(): mismatched obsv/fcst lengths stop (d-d)", {
  expect_error(
    afc(c(0, 1), c(0, 1, 1), obsv.type = "d", fcst.type = "d"),
    "same length"
  )
})

# ── missing category count ───────────────────────────────────────────────────

test_that("afc(): missing m for obsv.type='m' stops", {
  obsv <- c(1, 2, 3, 1, 2, 3)
  fcst <- as.double(obsv)
  expect_error(
    afc(obsv, fcst, obsv.type = "m", fcst.type = "c"),
    "number of.*categories"
  )
})

test_that("afc(): missing m for obsv.type='n' stops", {
  obsv <- c(1, 2, 3)
  fcst <- diag(3)
  expect_error(
    afc(obsv, fcst, obsv.type = "n", fcst.type = "p"),
    "number of.*categories"
  )
})

test_that("afc(): m-m without m2 stops", {
  obsv <- c(1, 2, 3, 1, 2, 3)
  expect_error(
    afc(obsv, obsv, obsv.type = "m", fcst.type = "m", m = 3),
    "BOTH observation and forecast"
  )
})

# ── ensemble / probabilistic dimension checks ────────────────────────────────

test_that("afc(): non-matrix fcst for fcst.type='e' stops (d-e)", {
  expect_error(
    afc(c(0, 1), c(0, 1), obsv.type = "d", fcst.type = "e"),
    "dimensions"
  )
})

test_that("afc(): fcst row count != length(obsv) stops (d-e)", {
  obsv <- c(0, 1, 1)
  fcst <- matrix(1:8, 4, 2)
  expect_error(
    afc(obsv, fcst, obsv.type = "d", fcst.type = "e"),
    "number of forecasts"
  )
})

test_that("afc(): probability outside [0,1] stops (d-p)", {
  expect_error(
    afc(c(0, 0, 1, 1), c(0, -0.1, 1, 1), obsv.type = "d", fcst.type = "p"),
    "probabilities"
  )
})

test_that("afc(): wrong number of probability columns stops (m-p)", {
  obsv <- c(1, 2, 3)
  fcst <- matrix(0.25, nrow = 3, ncol = 4)  # 3 rows (ok), 4 columns but m=3
  expect_error(
    afc(obsv, fcst, obsv.type = "m", fcst.type = "p", m = 3),
    "Probabilities must be assigned"
  )
})
