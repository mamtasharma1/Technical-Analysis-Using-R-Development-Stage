# BDA400 Assignment 5 - Moving Average Convergence Divergence (MACD)
# Requires ema.R to be sourced first. Uses base R only.

macd <- function(data, short_period, long_period, signal_period) {
  periods <- list(short_period, long_period, signal_period)
  for (p in periods) {
    if (length(p) != 1 || !is.finite(p) || p < 1 || p != as.integer(p)) {
      stop("All periods must be positive integers")
    }
  }
  if (short_period >= long_period) {
    stop("short_period must be less than long_period")
  }
  short_ema <- ema(data, as.integer(short_period))
  long_ema <- ema(data, as.integer(long_period))
  macd_line <- short_ema - long_ema
  signal_line <- ema(macd_line, as.integer(signal_period))
  histogram <- macd_line - signal_line
  result <- list(macd_line = macd_line,
                 signal_line = signal_line,
                 histogram = histogram)
  return(result)
}
