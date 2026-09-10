.complete_cases <- function(obsv, fcst) {
  keep <- stats::complete.cases(obsv, fcst)
  list(
    obsv = obsv[keep],
    fcst = if (is.matrix(fcst)) fcst[keep, , drop = FALSE] else fcst[keep]
  )
}
