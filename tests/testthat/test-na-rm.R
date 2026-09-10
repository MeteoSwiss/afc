# na.rm = TRUE: NA pairs are dropped and the score is computed on complete cases.
# One block per subfunction, then a dispatcher check.

# ── afc.cc ──────────────────────────────────────────────────────────────────

test_that("afc.cc: na.rm=TRUE drops NA obsv, perfect result", {
  obsv <- c(1, NA, 3, 4, 5)
  fcst <- c(1, 2,  3, 4, 5)
  expect_equal(afc.cc(obsv, fcst, na.rm = TRUE), 1)
})

test_that("afc.cc: na.rm=TRUE equals clean call", {
  obsv <- c(1, NA, 3, 4, 5)
  fcst <- c(1, 2,  3, 4, 5)
  expect_equal(afc.cc(obsv, fcst, na.rm = TRUE),
               afc.cc(c(1, 3, 4, 5), c(1, 3, 4, 5)))
})

# ── afc.ce ──────────────────────────────────────────────────────────────────

test_that("afc.ce: na.rm=TRUE drops NA fcst row, perfect result", {
  fcst <- matrix(c(1, 3, NA, 7,
                   2, 4,  6, 8), 4, 2)
  expect_equal(afc.ce(c(1, NA, 3, 4), fcst, na.rm = TRUE), 1)
})

# ── afc.dc ──────────────────────────────────────────────────────────────────

test_that("afc.dc: na.rm=TRUE drops NA obsv, perfect result", {
  obsv <- c(0, NA, 0, 1, 1, 1)
  fcst <- c(1,  2, 3, 4, 5, 6)
  expect_equal(afc.dc(obsv, fcst, na.rm = TRUE), 1)
})

# ── afc.dd ──────────────────────────────────────────────────────────────────

test_that("afc.dd: na.rm=TRUE result equals clean call", {
  obsv_na <- c(0, NA, 0, 1, 1, NA)
  fcst_na <- c(0,  1, 1, 0, 1,  0)
  expect_equal(afc.dd(obsv_na, fcst_na, na.rm = TRUE),
               afc.dd(c(0, 0, 1, 1), c(0, 1, 0, 1)))
})

# ── afc.de ──────────────────────────────────────────────────────────────────

test_that("afc.de: na.rm=TRUE drops NA obsv, perfect result", {
  obsv <- c(0, NA, 1, 1)
  fcst <- matrix(c(1, 2, 5, 6,
                   1, 2, 5, 6), 4, 2)
  expect_equal(afc.de(obsv, fcst, na.rm = TRUE), 1)
})

# ── afc.dm ──────────────────────────────────────────────────────────────────

test_that("afc.dm: na.rm=TRUE drops NA obsv, perfect result", {
  obsv <- c(0, NA, 1, 1)
  fcst <- c(1,  1, 2, 2)
  expect_equal(afc.dm(obsv, fcst, mf = 2, na.rm = TRUE), 1)
})

# ── afc.dp ──────────────────────────────────────────────────────────────────

test_that("afc.dp: na.rm=TRUE drops NA pair, perfect result", {
  obsv <- c(0, NA, 1, 1)
  fcst <- c(0,  0, 1, 1)
  expect_equal(afc.dp(obsv, fcst, na.rm = TRUE), 1)
})

# ── afc.mc ──────────────────────────────────────────────────────────────────

test_that("afc.mc: na.rm=TRUE drops NA obsv, perfect result", {
  obsv <- c(1, NA, 2, 3)
  fcst <- c(1,  2, 3, 4)
  expect_equal(afc.mc(obsv, fcst, m = 3, na.rm = TRUE), 1)
})

# ── afc.me ──────────────────────────────────────────────────────────────────

test_that("afc.me: na.rm=TRUE drops NA fcst row, perfect result", {
  obsv <- c(1, NA, 2, 3)
  fcst <- matrix(c(1, 2, 3, 4,
                   1, 2, 3, 4), 4, 2)
  expect_equal(afc.me(obsv, fcst, m = 3, na.rm = TRUE), 1)
})

# ── afc.mm ──────────────────────────────────────────────────────────────────

test_that("afc.mm: na.rm=TRUE drops NA pair, equals clean call", {
  obsv <- c(1, NA, 2, 3)
  fcst <- c(1,  2, 2, 3)
  expect_equal(afc.mm(obsv, fcst, mv = 3, mf = 3, na.rm = TRUE),
               afc.mm(c(1, 2, 3), c(1, 2, 3), mv = 3, mf = 3))
})

# ── afc.mp ──────────────────────────────────────────────────────────────────

test_that("afc.mp: na.rm=TRUE drops NA obsv, perfect result", {
  obsv <- c(1, NA, 3)
  fcst <- diag(3)
  expect_equal(afc.mp(obsv, fcst, m = 3, na.rm = TRUE), 1)
})

# ── afc.nn ──────────────────────────────────────────────────────────────────

test_that("afc.nn: na.rm=TRUE drops NA pair, equals clean call", {
  obsv <- c(1, NA, 2, 3)
  fcst <- c(1,  2, 2, 3)
  expect_equal(afc.nn(obsv, fcst, m = 3, na.rm = TRUE),
               afc.nn(c(1, 2, 3), c(1, 2, 3), m = 3))
})

# ── afc.np ──────────────────────────────────────────────────────────────────

test_that("afc.np: na.rm=TRUE drops NA obsv, perfect result", {
  # NA at position 2; after drop obsv=c(1,2,3), fcst=diag(3) — all 3 categories kept
  obsv <- c(1, NA, 2, 3)
  fcst <- rbind(c(1, 0, 0), c(0, 1, 0), c(0, 1, 0), c(0, 0, 1))
  expect_equal(afc.np(obsv, fcst, m = 3, na.rm = TRUE), 1)
})

# ── afc() dispatcher ─────────────────────────────────────────────────────────

test_that("afc(): na.rm=TRUE c-c, perfect after NA drop", {
  obsv <- c(1, NA, 3, 4, 5)
  fcst <- c(1,  2, 3, 4, 5)
  expect_equal(afc(obsv, fcst, obsv.type = "c", fcst.type = "c", na.rm = TRUE), 1)
})

test_that("afc(): na.rm=TRUE d-c, perfect after NA drop", {
  obsv <- c(0, NA, 0, 1, 1, 1)
  fcst <- c(1,  2, 3, 4, 5, 6)
  expect_equal(afc(obsv, fcst, obsv.type = "d", fcst.type = "c", na.rm = TRUE), 1)
})

test_that("afc(): na.rm=TRUE d-d, equals clean call", {
  obsv_na <- c(0, NA, 0, 1, 1, NA)
  fcst_na <- c(0,  1, 1, 0, 1,  0)
  expect_equal(
    afc(obsv_na, fcst_na, obsv.type = "d", fcst.type = "d", na.rm = TRUE),
    afc(c(0, 0, 1, 1), c(0, 1, 0, 1), obsv.type = "d", fcst.type = "d")
  )
})
