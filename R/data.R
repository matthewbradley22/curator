#' 985 species observations pulled from gbif using get_records_since_date function, then
#' passed through CoordinateCleaner::clean_coordinates
#'
#' A dataset containing biological and location data for 985 gbif obsrvations
#'
#' @format A data frame with 985 rows and 148 variables:
#' \describe{
#'   \item{scientific name}{scientific name from gbif
#'   ...
#' }
#' @source \url{https://www.gbif.org/occurrence/search}
"obsData"
