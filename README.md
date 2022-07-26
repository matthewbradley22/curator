
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
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

    #> Testing coordinate validity
    #> Flagged 0 records.
    #> Testing equal lat/lon
    #> Flagged 0 records.
    #> Testing zero coordinates
    #> Flagged 0 records.
    #> Testing country capitals
    #> Flagged 5 records.
    #> Testing country centroids
    #> Flagged 0 records.
    #> Testing sea coordinates
    #> OGR data source with driver: ESRI Shapefile 
    #> Source: "/private/var/folders/w3/nt2mw8xj72z9mmctnpprhvs80000gn/T/RtmpIZXxql", layer: "ne_50m_land"
    #> with 1420 features
    #> It has 3 fields
    #> Integer64 fields read as strings:  scalerank
    #> Flagged 35 records.
    #> Testing geographic outliers
    #> Flagged 16 records.
    #> Testing GBIF headquarters, flagging records around Copenhagen
    #> Flagged 0 records.
    #> Testing biodiversity institutions
    #> Flagged 0 records.
    #> Flagged 49 of 492 records, EQ = 0.1.
    #> Assuming "longitude" and "latitude" are longitude and latitude, respectively

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
