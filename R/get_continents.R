getContinents <- function(data,
                          country = "countryCode"){
  data_continent <- countrycode::countrycode(sourcevar = data[[country]],
                                origin = "iso3c",
                                destination = "continent")
  return(data_continent)
}
