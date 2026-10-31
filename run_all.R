# BDA400 Assignment 5 - Example runner and basic checks
# Run from this folder with: Rscript run_all.R

source("sma.R")
source("ema.R")
source("macd.R")
source("stdev.R")
source("linreg.R")
source("rsi.R")
source("stoch_rsi.R")
source("crossover.R")
source("crossunder.R")

sample_data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
cat("SMA (period 3):\n"); print(sma(sample_data, 3))
cat("EMA (period 3):\n"); print(round(ema(sample_data, 3), 4))
cat("MACD (3, 5, 2):\n"); print(macd(c(100, 105, 110, 115, 120, 125, 130), 3, 5, 2))
cat("Population standard deviation:\n"); print(stdev(sample_data))
cat("Linear regression:\n"); print(linreg(sample_data, 5, 0))
cat("RSI (period 5):\n"); print(rsi(c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62), 5))
cat("Stochastic RSI (5, 2, 2):\n"); print(stoch_rsi(c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62, 61, 66), 5, 2, 2))
a <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
b <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)
cat("Crossover:\n"); print(crossover(a, b))
cat("Crossunder:\n"); print(crossunder(a, b))

# Basic assertions to catch common implementation errors.
stopifnot(all.equal(sma(c(1, 2, 3, 4), 2), c(1.5, 2.5, 3.5)))
stopifnot(all.equal(ema(c(10, 12, 15), 3), c(10, 11, 13)))
stopifnot(abs(stdev(c(2, 4, 4, 4, 5, 5, 7, 9)) - 2) < 1e-8)
stopifnot(identical(crossunder(c(2, 1), c(1, 2)), c(FALSE, TRUE)))
cat("Basic checks passed.\n")
