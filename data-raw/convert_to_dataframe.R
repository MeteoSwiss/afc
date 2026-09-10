# Convert all cnrm.nino34 datasets from lists to data.frames.
# Run from the package root directory.

data_dir <- "data"

# Datasets where fcst is a 1D vector
simple <- c("cc", "dc", "dd", "dm", "dp", "mc", "mm")
for (sfx in simple) {
  nm <- paste0("cnrm.nino34.", sfx)
  load(file.path(data_dir, paste0(nm, ".RData")))
  d <- get(nm)
  assign(nm, data.frame(years = d$years, obsv = d$obsv, fcst = d$fcst))
  save(list = nm, file = file.path(data_dir, paste0(nm, ".RData")))
  cat("Converted", nm, "\n")
}

# Datasets where fcst is a 2D matrix (stored as a matrix-valued data.frame column)
matrix_fcst <- c("ce", "de", "me", "mp")
for (sfx in matrix_fcst) {
  nm <- paste0("cnrm.nino34.", sfx)
  load(file.path(data_dir, paste0(nm, ".RData")))
  d <- get(nm)
  df <- data.frame(years = d$years, obsv = d$obsv)
  df$fcst <- d$fcst
  assign(nm, df)
  save(list = nm, file = file.path(data_dir, paste0(nm, ".RData")))
  cat("Converted", nm, "\n")
}
