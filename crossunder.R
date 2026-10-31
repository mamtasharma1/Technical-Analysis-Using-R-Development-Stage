# BDA400 Assignment 5 - Crossunder
# Returns TRUE only when arr1 crosses from >= arr2 to < arr2.

crossunder <- function(arr1, arr2) {
  if (!is.numeric(arr1) || !is.numeric(arr2) || length(arr1) != length(arr2)) {
    stop("Both arrays should have the same length and be numeric")
  }
  if (any(!is.finite(arr1)) || any(!is.finite(arr2))) {
    stop("Both arrays must contain only finite values")
  }
  n <- length(arr1)
  crossunder_signals <- rep(FALSE, n)
  if (n >= 2) {
    for (i in 2:n) {
      crossunder_signals[i] <- arr1[i] < arr2[i] && arr1[i - 1] >= arr2[i - 1]
    }
  }
  return(crossunder_signals)
}
