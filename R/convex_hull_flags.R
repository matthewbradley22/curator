
#' Helper function to create a convex hull of a species on a specific continent.
#' Observation is flagged if it is outside convex hull
#'
#' @param data dataset of observations
#' @param ECD Expert curated dataset
#' @param ECDContinent Continent column name in ECD
#' @param datContinent Continent column name in new dataset
#' @param ECDspecies Species column name in ECD
#' @param datSpecies Species column name in new dataset
#' @param ECDlon Longitude column name in ECD
#' @param ECDlat Latitude column name in ECD
#' @param datLon Longitude column name in new dataset
#' @param datLat Latitude column name in new dataset
#'
#' @return dataset with new column of convex hull flags
#' @export
#'
#' @examples
.check_convex_hull_helper <- function(data,
                                      ECD,
                                      ECDContinent,
                                      datContinent,
                                      ECDspecies,
                                      datSpecies,
                                      ECDlon,
                                      ECDlat,
                                      datLon,
                                      datLat){

  conECD <- ECD[ECD[[ECDContinent]] == unique(data[[datContinent]]),]
  conECD <- conECD[conECD[[ECDspecies]] == unique(data[[datSpecies]]),]
  conECD <- conECD[!is.na(conECD[[1]]),]
  #>3 because convex hull cannot work with only 2 observations
  if(dim(conECD)[[1]] > 3 & dim(conECD)[[2]] > 0){
    #Flag data and ECD have opposite order of longitude latitude
    convexHull <- geometry::convhulln(cbind(conECD[[ECDlon]], conECD[[ECDlat]]))
    pointsInHull <- geometry::inhulln(convexHull, data.matrix(cbind(data[[datLon]], data[[datLat]])))
    data$.hull <-  pointsInHull
    data[data$.hull == FALSE, ".summary"] = FALSE
  } else  data$.hull <-  TRUE

  return(data)
}


#' Function to check if observations of specific species are within a convex hull
#' of species on the same continent
#'
#' @param data dataset of observations
#' @param ECD Expert curated dataset
#' @param ECDContinent Continent column name in ECD
#' @param datContinent Continent column name in new dataset
#' @param ECDspecies Species column name in ECD
#' @param datSpecies Species column name in new dataset
#' @param ECDlon Longitude column name in ECD
#' @param ECDlat Latitude column name in ECD
#' @param datLon Longitude column name in new dataset
#' @param datLat Latitude column name in new dataset
#'
#' @return dataset with new column of convex hull flags
#' @export
#'
#' @examples
check_convex_hull <- function(data,
                              ECD,
                              ECDContinent = "continent",
                              datContinent = "continent",
                              ECDspecies = "species",
                              datSpecies = "species",
                              ECDlon = "decimalLongitude",
                              ECDlat = "decimalLatitude",
                              datLon = "decimalLongitude",
                              datLat = "decimalLatitude"){

  continent_data <- split(data, list(data[[datContinent]], data[[datSpecies]]), drop = TRUE)
  ECD <- ECD[!is.na(ECD[[ECDContinent]]),]
  updated_continent_data <- lapply(continent_data, .check_convex_hull_helper,
                                   ECD = ECD,
                                   ECDContinent = ECDContinent,
                                   datContinent = datContinent,
                                   ECDspecies = ECDspecies,
                                   datSpecies = datSpecies,
                                   ECDlon = ECDlon,
                                   ECDlat = ECDlat,
                                   datLon = datLon,
                                   datLat = datLat)
  updated_continent_data <- unsplit(updated_continent_data, list(data$continent, data$species), drop = TRUE)
  return(updated_continent_data)
}
