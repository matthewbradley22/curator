#' Create a continent column for a dataset with a countryCode column
#'
#' @param data dataset with observations
#' @param country column name of column with country codes
#'
#' @return dataset with new continent column
#' @export
#'
#' @examples get_continents(curator::obsData)
#'
get_continents <- function(data,
                          country = "countryCode"){
  data_continent <- countrycode::countrycode(sourcevar = data[[country]],
                                origin = "iso3c",
                                destination = "continent")
  return(data_continent)
}
