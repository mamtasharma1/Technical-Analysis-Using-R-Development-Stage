# BDA400 Assignment 5 - Population Standard Deviation
# The assignment's formula divides squared deviations by n (not n - 1).

stdev <- function(data) {
  if (!is.numeric(data) || length(data) == 0 || any(!is.finite(data))) {
    stop("data must be a non-empty numeric vector without NA/Inf values")
  }
  mean_value <- sum(data) / length(data)
  diff_values <- data - mean_value
  squared_diff <- diff_values * diff_values
  variance <- sum(squared_diff) / length(squared_diff)
  standard_deviation <- sqrt(variance)
  return(standard_deviation)
}
