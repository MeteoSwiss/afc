# Perfect forecast: score must equal 1.
# Worst forecast (anti-correlated): score must equal 0.
# No-skill (uncorrelated): score must equal 0.5.

# ── rank.ensembles ──────────────────────────────────────────────────────────

test_that("rank.ensembles: monotone ensembles get ascending ranks", {
  fcst <- matrix(c(1, 3, 5, 2, 4, 6), 3, 2)
  expect_equal(rank.ensembles(fcst), c(1, 2, 3))
})

test_that("rank.ensembles: tied ensembles get equal half-integer ranks", {
  fcst <- matrix(c(1, 1, 5, 2, 2, 6), 3, 2)
  expect_equal(rank.ensembles(fcst), c(1.5, 1.5, 3))
})

# ── afc.cc ──────────────────────────────────────────────────────────────────

test_that("afc.cc: perfect forecast scores 1", {
  obsv <- c(1, 2, 3, 4, 5)
  expect_equal(afc.cc(obsv, obsv), 1)
})

test_that("afc.cc: worst forecast scores 0", {
  obsv <- c(1, 2, 3, 4, 5)
  expect_equal(afc.cc(obsv, rev(obsv)), 0)
})

# ── afc.ce ──────────────────────────────────────────────────────────────────

test_that("afc.ce: perfect ensemble forecast scores 1", {
  obsv <- c(1, 2, 3, 4)
  fcst <- matrix(c(1, 3, 5, 7, 2, 4, 6, 8), 4, 2)
  expect_equal(afc.ce(obsv, fcst), 1)
})

# ── afc.dc ──────────────────────────────────────────────────────────────────

test_that("afc.dc: perfect continuous forecast scores 1", {
  obsv <- c(0, 0, 0, 1, 1, 1)
  fcst <- c(1, 2, 3, 4, 5, 6)
  expect_equal(afc.dc(obsv, fcst), 1)
})

test_that("afc.dc: worst continuous forecast scores 0", {
  obsv <- c(1, 1, 1, 0, 0, 0)
  fcst <- c(1, 2, 3, 4, 5, 6)
  expect_equal(afc.dc(obsv, fcst), 0)
})

# ── afc.dd ──────────────────────────────────────────────────────────────────

test_that("afc.dd: perfect dichotomous forecast scores 1", {
  obsv <- c(0, 0, 1, 1)
  expect_equal(afc.dd(obsv, obsv), 1)
})

test_that("afc.dd: worst dichotomous forecast scores 0", {
  obsv <- c(0, 0, 1, 1)
  expect_equal(afc.dd(obsv, c(1, 1, 0, 0)), 0)
})

test_that("afc.dd: no-skill forecast scores 0.5", {
  obsv <- c(0, 0, 1, 1)
  fcst <- c(0, 1, 0, 1)
  expect_equal(afc.dd(obsv, fcst), 0.5)
})

# ── afc.de ──────────────────────────────────────────────────────────────────

test_that("afc.de: perfect ensemble forecast scores 1", {
  obsv <- c(0, 0, 1, 1)
  fcst <- matrix(c(1, 2, 5, 6, 1, 2, 5, 6), 4, 2)
  expect_equal(afc.de(obsv, fcst), 1)
})

# ── afc.dm ──────────────────────────────────────────────────────────────────

test_that("afc.dm: perfect polychotomous forecast scores 1", {
  obsv <- c(0, 0, 1, 1)
  fcst <- c(1, 1, 2, 2)
  expect_equal(afc.dm(obsv, fcst, mf = 2), 1)
})

# ── afc.dp ──────────────────────────────────────────────────────────────────

test_that("afc.dp: perfect probabilistic forecast scores 1", {
  obsv <- c(0, 0, 1, 1)
  fcst <- c(0, 0, 1, 1)
  expect_equal(afc.dp(obsv, fcst), 1)
})

test_that("afc.dp: worst probabilistic forecast scores 0", {
  obsv <- c(0, 0, 1, 1)
  fcst <- c(1, 1, 0, 0)
  expect_equal(afc.dp(obsv, fcst), 0)
})

# ── afc.mc ──────────────────────────────────────────────────────────────────

test_that("afc.mc: perfect continuous forecast scores 1", {
  obsv <- 1:3
  fcst <- as.double(1:3)
  expect_equal(afc.mc(obsv, fcst, m = 3), 1)
})

# ── afc.me ──────────────────────────────────────────────────────────────────

test_that("afc.me: perfect ensemble forecast scores 1", {
  obsv <- 1:3
  fcst <- matrix(c(1, 3, 5, 2, 4, 6), 3, 2)
  expect_equal(afc.me(obsv, fcst, m = 3), 1)
})

# ── afc.mm ──────────────────────────────────────────────────────────────────

test_that("afc.mm: perfect polychotomous forecast scores 1", {
  obsv <- c(1, 1, 2, 2, 3, 3)
  expect_equal(afc.mm(obsv, obsv, mv = 3, mf = 3), 1)
})

# ── afc.mp ──────────────────────────────────────────────────────────────────

test_that("afc.mp: perfect probabilistic forecast scores 1", {
  obsv <- 1:3
  fcst <- diag(3)
  expect_equal(afc.mp(obsv, fcst, m = 3), 1)
})

# ── afc.nn ──────────────────────────────────────────────────────────────────

test_that("afc.nn: perfect nominal forecast scores 1", {
  obsv <- c(1, 1, 2, 2, 3, 3)
  expect_equal(afc.nn(obsv, obsv, m = 3), 1)
})

# ── afc.np ──────────────────────────────────────────────────────────────────

test_that("afc.np: perfect probabilistic forecast scores 1", {
  obsv <- 1:3
  fcst <- diag(3)
  expect_equal(afc.np(obsv, fcst, m = 3), 1)
})

# ── afc() master dispatcher ─────────────────────────────────────────────────

test_that("afc(): delegates to afc.cc, perfect forecast", {
  obsv <- c(1, 2, 3, 4, 5)
  expect_equal(afc(obsv, obsv, obsv.type = "c", fcst.type = "c"), 1)
})

test_that("afc(): delegates to afc.dd, perfect forecast", {
  obsv <- c(0, 0, 1, 1)
  expect_equal(afc(obsv, obsv, obsv.type = "d", fcst.type = "d"), 1)
})

test_that("afc(): delegates to afc.mc, perfect forecast", {
  obsv <- 1:4
  fcst <- as.double(1:4)
  expect_equal(afc(obsv, fcst, obsv.type = "m", fcst.type = "c", m = 4), 1)
})
