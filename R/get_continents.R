#' Create a continent column for a dataset with a countryCode column
#'
#' @param data dataset with observations
#' @param country column name of countries
#'
#' @return dataset with new continent column
#' @export
#'
#' @examples getContinents(data)
#'
getContinents <- function(data,
                          country = "countryCode"){
  data_continent <- countrycode::countrycode(sourcevar = data[[country]],
                                origin = "iso3c",
                                destination = "continent")
  return(data_continent)
}
