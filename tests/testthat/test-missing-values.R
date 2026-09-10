# All functions must return NA when obsv or fcst contains NA.
# The master afc() inherits this behaviour via its subfunctions.

# ── afc.cc ──────────────────────────────────────────────────────────────────

test_that("afc.cc: NA in obsv returns NA", {
  expect_true(is.na(afc.cc(c(1, NA, 3, 4, 5), c(1, 2, 3, 4, 5))))
})

test_that("afc.cc: NA in fcst returns NA", {
  expect_true(is.na(afc.cc(c(1, 2, 3, 4, 5), c(1, NA, 3, 4, 5))))
})

# ── afc.ce ──────────────────────────────────────────────────────────────────

test_that("afc.ce: NA in obsv returns NA", {
  fcst <- matrix(c(1, 3, 5, 7, 2, 4, 6, 8), 4, 2)
  expect_true(is.na(afc.ce(c(1, NA, 3, 4), fcst)))
})

test_that("afc.ce: NA in fcst matrix returns NA", {
  fcst <- matrix(c(1, 3, NA, 7, 2, 4, 6, 8), 4, 2)
  expect_true(is.na(afc.ce(c(1, 2, 3, 4), fcst)))
})

# ── afc.dc ──────────────────────────────────────────────────────────────────

test_that("afc.dc: NA in obsv returns NA", {
  expect_true(is.na(afc.dc(c(0, NA, 1, 1), c(1, 2, 3, 4))))
})

test_that("afc.dc: NA in fcst returns NA", {
  expect_true(is.na(afc.dc(c(0, 0, 1, 1), c(1, NA, 3, 4))))
})

# ── afc.dd ──────────────────────────────────────────────────────────────────

test_that("afc.dd: NA in obsv returns NA", {
  expect_true(is.na(afc.dd(c(0, NA, 1, 1), c(0, 0, 1, 1))))
})

test_that("afc.dd: NA in fcst returns NA", {
  expect_true(is.na(afc.dd(c(0, 0, 1, 1), c(0, NA, 1, 1))))
})

# ── afc.de ──────────────────────────────────────────────────────────────────

test_that("afc.de: NA in obsv returns NA", {
  fcst <- matrix(c(1, 2, 5, 6, 1, 2, 5, 6), 4, 2)
  expect_true(is.na(afc.de(c(0, NA, 1, 1), fcst)))
})

test_that("afc.de: NA in fcst matrix returns NA", {
  fcst <- matrix(c(1, 2, NA, 6, 1, 2, 5, 6), 4, 2)
  expect_true(is.na(afc.de(c(0, 0, 1, 1), fcst)))
})

# ── afc.dm ──────────────────────────────────────────────────────────────────

test_that("afc.dm: NA in obsv returns NA", {
  expect_true(is.na(afc.dm(c(0, NA, 1, 1), c(1, 1, 2, 2), mf = 2)))
})

test_that("afc.dm: NA in fcst returns NA", {
  expect_true(is.na(afc.dm(c(0, 0, 1, 1), c(1, NA, 2, 2), mf = 2)))
})

# ── afc.dp ──────────────────────────────────────────────────────────────────

test_that("afc.dp: NA in obsv returns NA", {
  expect_true(is.na(afc.dp(c(0, NA, 1, 1), c(0, 0, 1, 1))))
})

test_that("afc.dp: NA in fcst returns NA", {
  expect_true(is.na(afc.dp(c(0, 0, 1, 1), c(0, NA, 1, 1))))
})

# ── afc.mc ──────────────────────────────────────────────────────────────────

test_that("afc.mc: NA in obsv returns NA", {
  expect_true(is.na(afc.mc(c(1, NA, 3), c(1, 2, 3), m = 3)))
})

test_that("afc.mc: NA in fcst returns NA", {
  expect_true(is.na(afc.mc(c(1, 2, 3), c(1, NA, 3), m = 3)))
})

# ── afc.me ──────────────────────────────────────────────────────────────────

test_that("afc.me: NA in obsv returns NA", {
  fcst <- matrix(c(1, 3, 5, 2, 4, 6), 3, 2)
  expect_true(is.na(afc.me(c(1, NA, 3), fcst, m = 3)))
})

test_that("afc.me: NA in fcst matrix returns NA", {
  fcst <- matrix(c(1, NA, 5, 2, 4, 6), 3, 2)
  expect_true(is.na(afc.me(c(1, 2, 3), fcst, m = 3)))
})

# ── afc.mm ──────────────────────────────────────────────────────────────────

test_that("afc.mm: NA in obsv returns NA", {
  expect_true(is.na(afc.mm(c(1, NA, 3), c(1, 2, 3), mv = 3, mf = 3)))
})

test_that("afc.mm: NA in fcst returns NA", {
  expect_true(is.na(afc.mm(c(1, 2, 3), c(1, NA, 3), mv = 3, mf = 3)))
})

# ── afc.mp ──────────────────────────────────────────────────────────────────

test_that("afc.mp: NA in obsv returns NA", {
  fcst <- diag(3)
  expect_true(is.na(afc.mp(c(1, NA, 3), fcst, m = 3)))
})

test_that("afc.mp: NA in fcst matrix returns NA", {
  fcst <- matrix(c(1, 0, NA, 0, 1, 0, 0, 0, 1), 3, 3)
  expect_true(is.na(afc.mp(c(1, 2, 3), fcst, m = 3)))
})

# ── afc.nn ──────────────────────────────────────────────────────────────────

test_that("afc.nn: NA in obsv returns NA", {
  expect_true(is.na(afc.nn(c(1, NA, 3), c(1, 2, 3), m = 3)))
})

test_that("afc.nn: NA in fcst returns NA", {
  expect_true(is.na(afc.nn(c(1, 2, 3), c(1, NA, 3), m = 3)))
})

# ── afc.np ──────────────────────────────────────────────────────────────────

test_that("afc.np: NA in obsv returns NA", {
  fcst <- diag(3)
  expect_true(is.na(afc.np(c(1, NA, 3), fcst, m = 3)))
})

test_that("afc.np: NA in fcst matrix returns NA", {
  fcst <- matrix(c(1, 0, NA, 0, 1, 0, 0, 0, 1), 3, 3)
  expect_true(is.na(afc.np(c(1, 2, 3), fcst, m = 3)))
})

# ── afc() master: NA propagates through dispatcher ──────────────────────────

test_that("afc(): NA in obsv returns NA (c-c case)", {
  obsv <- c(1, NA, 3, 4, 5)
  fcst <- c(1, 2, 3, 4, 5)
  expect_true(is.na(afc(obsv, fcst, obsv.type = "c", fcst.type = "c")))
})

test_that("afc(): NA in fcst returns NA (d-d case)", {
  obsv <- c(0, 0, 1, 1)
  fcst <- c(0, NA, 1, 1)
  expect_true(is.na(afc(obsv, fcst, obsv.type = "d", fcst.type = "d")))
})
