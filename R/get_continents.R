#' Create a continent column for a dataset with a countryCode column
#'
#' @param data dataset with observations
#' @param country column name of column with country codes
#' @param original type of data in the source column which contains cuntries to identify continent from
#'
#' @return dataset of same type that was passed to it. One column of continents.
#' @export
#'
#' @examples
#' get_continents(obsData)
#'
get_continents <- function(data,
                          country = "countryCode",
                          original = "iso3c"){
  data_continent <- countrycode::countrycode(sourcevar = data[[country]],
                                origin = original,
                                destination = "continent")
  return(data_continent)
}
