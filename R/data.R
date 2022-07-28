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
#'   \item{.val}{Checks if coordinates correspond to a lat/lon coordinate reference system. True indicates no flag}
#'   \item{.equ}{Tests for equal absolute longitude and latitude. True indicates no flag}
#'   \item{.zer}{scientific name from gbif}
#'   \item{.cap}{scientific name from gbif}
#'   \item{.cen}{scientific name from gbif}
#'   \item{.sea}{scientific name from gbif}
#'   \item{.otl}{scientific name from gbif}
#'   \item{.gbf}{scientific name from gbif}
#'   \item{.inst}{scientific name from gbif}
#'   \item{.summary}{scientific name from gbif}
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
#'   \item{scientificNameORpreviousID}{scientific name from gbif}
#'   \item{species}{scientific name from gbif}
#'   \item{decimalLongitude}{scientific name from gbif}
#'   \item{scientificNameORpreviousID}{scientific name from gbif}
#'   \item{decimalLatitude}{scientific name from gbif}
#'   \item{CountryCode}{scientific name from gbif}
#'   ...
#' }
#' @source \url{https://www.gbif.org/occurrence/search}
"ECD"


