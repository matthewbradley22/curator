#' 985 species observations pulled from gbif using get_records_since_date function, then
#' passed through CoordinateCleaner::clean_coordinates
#'
#' A dataset containing biological and location data for 985 gbif obsrvations
#'
#' @format A data frame with 985 rows and 148 variables:
#' \describe{
#'   \item{scientificName}{scientific name from gbif}
#'   \item{decimalLatitude}{Latitude coordinates in decimal degrees}
#'   \item{decimalLongitude}{Longitude coordinates in decimal degrees}
#'   \item{species}{Genus and species epithet}
#'   \item{countryCode}{ISO3 ccoutry code}
#'   \item{.val}{Checks if coordinates correspond to a lat/lon coordinate reference system. True indicates no flag.}
#'   \item{.equ}{Tests for equal absolute longitude and latitude. True indicates no flag.}
#'   \item{.zer}{Tests for equal latitude and longitude and a radius around the point 0/0.  True indicates no flag.}
#'   \item{.cap}{ tests a radius around adm-0 capitals. True indicates no flag.}
#'   \item{.cen}{Tests a radius around country centroids. True indicates no flag.}
#'   \item{.sea}{Tests if coordinates fall into the ocean. True indicates no flag}
#'   \item{.otl}{Tests each species for outlier records. True indicates no flag.}
#'   \item{.gbf}{Tests a one-degree radius around the GBIF headquarters in Copenhagen, Denmark. True indicates no flag.}
#'   \item{.inst}{Tests a radius around known biodiversity institutions from instiutions. True indicates no flag.}
#'   \item{.summary}{False if any of the flag tests are False, otherwise True.}
#'   ...
#' }
#' @source \url{https://www.gbif.org/occurrence/search}
"obsData"


#' 50,000 observations from expert curated dataset
#'
#' A dataset containing biological and location data for 50,000 expert curated observations
#'
#' @format A data frame with 985 rows and 148 variables:
#' \describe{
#'   \item{species}{Genus and species epithet.}
#'   \item{decimalLongitude}{Longitude coordinates in decimal degrees}
#'   \item{decimalLatitude}{Latitude coordinates in decimal degrees}
#'   \item{CountryCode}{ISO3 ccoutry code}
#'   ...
#' }
#' @source \url{https://www.gbif.org/occurrence/search}
"ECD"


