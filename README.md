
<!-- README.md is generated from README.Rmd. Please edit that file -->

# curator

<!-- badges: start -->
<!-- badges: end -->

The goal of curator is to provide an accessible way for biologists to
curate biological datasets. Specifically, the package provides functions
to flag suspicious observations based on location, name, and species. It
also provides an easy way to map observations.

## Installation

You can install the development version of curator from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("matthewbradley22/curator")
```

## Example

This is a basic example of retriving data from gbif
(get_records_since_date), flagging it with CoordinateCleaner
(flag_data), and flagging any species names in the data that do not
occur in the example ECD provided in the package.

``` r
library(curator)

data = get_records_since_date(numObs = 25)
flags = flag_data(data)
```

``` r
flags = flag_names(flags, curator::ECD)
summary(flags)
#>     .val     .equ     .zer     .cap     .cen     .sea     .otl     .gbf 
#>        0        0        0        0        0        4        0        0 
#>    .inst .summary    .name 
#>        0        4        0
```

## Example dynamic map:

<a href="https://matthewbradley22.github.io/curator/curatorExample.html"
target="_blank">Dynamic map example</a>
