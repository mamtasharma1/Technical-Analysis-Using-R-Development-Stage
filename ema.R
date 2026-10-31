# BDA400 Assignment 5 - Exponential Moving Average (EMA)
# Uses the assignment's specified initialization: EMA[1] = data[1].

ema <- function(data, period) {
  if (!is.numeric(data) || length(data) == 0 || any(!is.finite(data))) {
    stop("data must be a non-empty numeric vector without NA/Inf values")
  }
  if (length(period) != 1 || !is.finite(period) || period < 1 ||
      period != as.integer(period)) {
    stop("period must be a positive integer")
  }
  period <- as.integer(period)
  multiplier <- 2 / (period + 1)
  ema_values <- numeric(length(data))

  for (i in seq_along(data)) {
    if (i == 1) {
      ema_values[i] <- data[i]
    } else {
      ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier +
        ema_values[i - 1]
    }
  }
  return(ema_values)
}
