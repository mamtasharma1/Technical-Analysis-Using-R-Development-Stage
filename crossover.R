# BDA400 Assignment 5 - Crossover
# Returns "Up", "Down", or "None" at each point, as specified in the pseudocode.

crossover <- function(arr1, arr2) {
  if (!is.numeric(arr1) || !is.numeric(arr2) || length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length and be numeric")
  }
  if (any(!is.finite(arr1)) || any(!is.finite(arr2))) {
    stop("Both arrays must contain only finite values")
  }
  n <- length(arr1)
  crossover_signals <- rep("None", n)
  if (n >= 2) {
    for (i in 2:n) {
      if (arr1[i] > arr2[i] && arr1[i - 1] <= arr2[i - 1]) {
        crossover_signals[i] <- "Up"
      } else if (arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]) {
        crossover_signals[i] <- "Down"
      }
    }
  }
  return(crossover_signals)
}
