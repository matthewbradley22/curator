#' 985 species observations pulled from gbif using get_records_since_date function, then
#' passed through CoordinateCleaner::clean_coordinates
#'
#' A dataset containing biological and location data for 985 gbif obsrvations
#'
#' @format A data frame with 985 rows and 148 variables:
#' \describe{
#'   \item{scientificName}{scientific name from gbif}
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
#'   ...
#' }
#' @source \url{https://www.gbif.org/occurrence/search}
"ECD"


