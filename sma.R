# BDA400 Assignment 5 - Simple Moving Average (SMA)
# Uses base R only. Returns one value for each complete rolling window.

sma <- function(data, period) {
  if (!is.numeric(data) || length(data) == 0 || any(!is.finite(data))) {
    stop("data must be a non-empty numeric vector without NA/Inf values")
  }
  if (length(period) != 1 || !is.finite(period) || period < 1 ||
      period != as.integer(period)) {
    stop("period must be a positive integer")
  }
  period <- as.integer(period)
  n <- length(data)
  if (n < period) {
    stop("Data length should be greater than or equal to the period")
  }

  sma_values <- numeric(n - period + 1)
  for (i in seq_len(n - period + 1)) {
    current_window <- data[i:(i + period - 1)]
    sma_values[i] <- sum(current_window) / period
  }
  return(sma_values)
}
