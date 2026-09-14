# NBER business cycle reference dates

Peak and trough months of US business cycles as dated by the NBER
Business Cycle Dating Committee, and the length of each contraction in
months.

## Usage

``` r
nber_rec
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 35
rows and 3 columns.

## Source

<https://www.nber.org/research/data/us-business-cycle-expansions-and-contractions>

## Examples

``` r
rec <- subset(nber_rec, Peak >= as.Date("1960-01-01"))
plot(sw2001$date, sw2001$un, type = "l", xlab = "", ylab = "Unemployment")
rect(rec$Peak, -1e3, rec$Trough, 1e3, col = adjustcolor("grey", 0.4), border = NA)
```
