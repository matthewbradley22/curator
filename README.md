
<!-- README.md is generated from README.Rmd. Please edit that file -->

# curatoR

<!-- badges: start -->
<!-- badges: end -->

The goal of curatoR is to provide an accessible way for biologists to
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

## Documentation:

For an in depth example of the curatoR package, visit
<https://matthewbradley22.github.io/curator/>

## Example

This is a basic example of retriving data from gbif, flagging it with
CoordinateCleaner, and flagging any species names in the data that do
not occur in the example ECD provided in the package.

``` r
library(curator)

#Retrieve data with rgbig::occ_search and pass to CoordinateCleaner::clean_coordinates
data = occ_since(numObs = 500)
flags = flag_data(data)
```

``` r
#Flag names that do not occur in ECD
flags = flag_names(flags, curator::ECD)
summary(flags)
#>     .val     .equ     .zer     .cap     .cen     .sea     .otl     .gbf 
#>        0        0        0        5        0       35       10        0 
#>    .inst .summary    .name 
#>        0       53        6
```

## Example dynamic map:

<a href="https://matthewbradley22.github.io/curator/curatorExample.html"
target="_blank">Dynamic map example</a>
