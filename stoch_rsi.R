# BDA400 Assignment 5 - Stochastic RSI
# Requires rsi.R to be sourced first. Follows the handout's normalization approach:
# normalize valid RSI values using their overall minimum and maximum, then smooth %K/%D.

stoch_rsi <- function(data, period, k_period, d_period) {
  check_period <- function(p, label) {
    if (length(p) != 1 || !is.finite(p) || p < 1 || p != as.integer(p)) {
      stop(paste(label, "must be a positive integer"))
    }
    as.integer(p)
  }
  period <- check_period(period, "period")
  k_period <- check_period(k_period, "k_period")
  d_period <- check_period(d_period, "d_period")

  rsi_values <- rsi(data, period)
  valid <- rsi_values[!is.na(rsi_values)]
  if (length(valid) == 0) stop("Not enough valid RSI values to calculate StochRSI")
  min_rsi <- min(valid)
  max_rsi <- max(valid)
  if (max_rsi == min_rsi) {
    normalized <- rep(NA_real_, length(rsi_values))
    normalized[!is.na(rsi_values)] <- 0
  } else {
    normalized <- (rsi_values - min_rsi) / (max_rsi - min_rsi)
  }

  # Preserve alignment with the original input while averaging complete windows.
  k_line <- rep(NA_real_, length(data))
  valid_start <- period + k_period
  if (length(data) >= valid_start) {
    for (i in valid_start:length(data)) {
      window <- normalized[(i - k_period + 1):i]
      if (all(is.finite(window))) k_line[i] <- sum(window) / k_period
    }
  }

  d_line <- rep(NA_real_, length(data))
  first_d <- valid_start + d_period - 1
  if (length(data) >= first_d) {
    for (i in first_d:length(data)) {
      window <- k_line[(i - d_period + 1):i]
      if (all(is.finite(window))) d_line[i] <- sum(window) / d_period
    }
  }
  return(list(k_line = k_line, d_line = d_line))
}
