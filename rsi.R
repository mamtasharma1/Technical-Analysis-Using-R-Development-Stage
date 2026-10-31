# BDA400 Assignment 5 - Relative Strength Index (RSI)
# Wilder smoothing; output is aligned to the input, with initial values as NA.

rsi <- function(data, period) {
  if (!is.numeric(data) || length(data) < 2 || any(!is.finite(data))) {
    stop("data must be a numeric vector with at least two finite values")
  }
  if (length(period) != 1 || !is.finite(period) || period < 1 ||
      period != as.integer(period)) {
    stop("period must be a positive integer")
  }
  period <- as.integer(period)
  if (length(data) <= period) {
    stop("data length must be greater than period")
  }

  diff_values <- diff(data)
  gains <- pmax(diff_values, 0)
  losses <- pmax(-diff_values, 0)
  rsi_values <- rep(NA_real_, length(data))

  avg_gain <- sum(gains[seq_len(period)]) / period
  avg_loss <- sum(losses[seq_len(period)]) / period

  calc_rsi <- function(gain, loss) {
    if (loss == 0 && gain == 0) return(50)
    if (loss == 0) return(100)
    if (gain == 0) return(0)
    rs <- gain / loss
    100 - (100 / (1 + rs))
  }

  rsi_values[period + 1] <- calc_rsi(avg_gain, avg_loss)
  if (length(data) > period + 1) {
    for (i in (period + 2):length(data)) {
      change_index <- i - 1
      avg_gain <- (avg_gain * (period - 1) + gains[change_index]) / period
      avg_loss <- (avg_loss * (period - 1) + losses[change_index]) / period
      rsi_values[i] <- calc_rsi(avg_gain, avg_loss)
    }
  }
  return(rsi_values)
}
