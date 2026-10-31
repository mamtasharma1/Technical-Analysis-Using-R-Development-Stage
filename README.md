# BDA400 Assignment 5 — Technical Analysis using R

## Contents
- `sma.R` — Simple Moving Average
- `ema.R` — Exponential Moving Average
- `macd.R` — MACD line, signal line, and histogram
- `stdev.R` — population standard deviation, using the assignment's denominator `n`
- `linreg.R` — simple linear regression using the assignment's source window and offset
- `rsi.R` — Relative Strength Index using Wilder smoothing
- `stoch_rsi.R` — Stochastic RSI with %K and %D lines
- `crossover.R` — upward/downward crossover labels
- `crossunder.R` — crossunder Boolean signals
- `run_all.R` — examples and basic assertions
- `Assignment_Explanation.docx` and `.pdf` — written explanation and instructions
- `Cover_Page.docx` and `.pdf` — cover page template

## How to run
1. Install R (no additional packages are required).
2. Put all `.R` files in the same folder.
3. Open a terminal in that folder and run `Rscript run_all.R`, or open `run_all.R` in RStudio and click **Source**.
4. The runner sources the individual functions, prints example results, and runs basic assertions.

## Notes
- The implementation uses base R only, as required by the assignment.
- SMA returns one result for each complete window (`length(data) - period + 1`).
- EMA follows the supplied pseudocode and starts with the first data point.
- Standard deviation follows the handout's population formula (divide by `n`, not `n - 1`).
- RSI output is aligned to the input vector and uses `NA` until the first complete period is available.
- Stochastic RSI follows the handout's normalization idea and keeps output vectors aligned to the original data. This makes the values easier to compare with dates/prices.
- Crossover returns `"Up"`, `"Down"`, or `"None"` as described in its pseudocode. Crossunder returns Boolean values.
- This is an educational implementation, not investment advice. The sample data are hypothetical and are not a recommendation to trade.
