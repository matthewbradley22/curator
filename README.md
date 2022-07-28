
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

This is a basic example which shows you how to solve a common problem:

``` r
library(curator)

data = get_records_since_date(numObs = 10)
```

<a href="https://matthewbradley22.github.io/curator/curatorExample.html"
target="_blank">Dynamic map example</a>
