#' Helper function to flag species occurences that are over a certain distance from the center
#' of their distribution on a given continet
#'
#' @param data new dataset
#' @param ECD expert curated dataset
#' @param ECDContinent continent column name in ECD
#' @param datContinent continent column name in new dataset
#' @param ECDspecies species column name in ECD
#' @param datSpecies species column name in new dataset
#' @param ECDlongitude longitude column name in ECD
#' @param ECDlatitude latitude column name in ECD
#' @param datLongitude longtiude column name in new dataset
#' @param datLatitude latitude column name in new dataset
#'
#' @return dataset of the same class passed to it. New column of distance flags
#' @export
#'
#' @examples
.distance_flags_helper <- function(data,
                                   ECD,
                                   ECDContinent,
                                   datContinent,
                                   ECDspecies,
                                   datSpecies,
                                   ECDlongitude,
                                   ECDlatitude,
                                   datLongitude,
                                   datLatitude){
  species <- ECD[ECD[[ECDspecies]] == unique(data[[datSpecies]]),]
  species <- species[species[[ECDContinent]] == unique(data[[datContinent]]),]
  if(nrow(species > 0)){
    meanLong = mean(species[[ECDlongitude]], na.rm = T)
    meanLat = mean(species[[ECDlatitude]], na.rm = T)
    species <- species[!is.na(species[[ECDlongitude]]) & !is.na(species[[ECDlatitude]]),]
    eucDistances <- apply(cbind(species[[ECDlongitude]], species[[ECDlatitude]]), 1, function(x) sqrt((x[1] - meanLong)^2 + (x[2] - meanLat)^2))
    stDev <- sqrt(sum(eucDistances^2) / length(eucDistances))
    newEucDistances <- apply(cbind(data[[datLongitude]], data[[datLatitude]]), 1, function(x) sqrt((x[1] - meanLong)^2 + (x[2] - meanLat)^2))
    distanceFlag <-  !(unlist(lapply(newEucDistances, function(x) x > (2*stDev))))
    data$.dist = distanceFlag
    data[data$.dist == FALSE, ".summary"] = FALSE
  }

  #What to do if sepcies not in ECD
  else{
    data$.dist = TRUE
  }

  return(data)
}

#' Flags species occurences that are over a certain distance from the center of the species distribution
#'
#' @param data new dataset
#' @param ECD expert curated dataset
#' @param ECDContinent continent column name in ECD
#' @param datContinent continent column name in new dataset
#' @param ECDspecies species column name in ECD
#' @param datSpecies species column name in new dataset
#' @param ECDlongitude longitude column name in ECD
#' @param ECDlatitude latitude column name in ECD
#' @param datLongitude longtiude column name in new dataset
#' @param datLatitude latitude column name in new dataset
#'
#'
#' @return dataset of the same class passed to it. New column of distance flags
#' @export
#'
#' @examples
distance_flags <- function(data,
                           ECD,
                           ECDContinent = "continent",
                           datContinent = "continent",
                           ECDspecies = "species",
                           datSpecies = "species",
                           ECDlongitude = "decimalLongitude",
                           ECDlatitude = "decimalLatitude",
                           datLongitude = "decimalLongitude",
                           datLatitude = "decimalLatitude"){
  distance_data <-  split(data, list(data[[datContinent]], data[[datSpecies]]), drop = TRUE)
  updated_distance_data <- lapply(distance_data, .distance_flags_helper,
                                  ECD = ECD,
                                  ECDContinent = ECDContinent,
                                  datContinent = datContinent,
                                  ECDspecies = ECDspecies,
                                  datSpecies = datSpecies,
                                  ECDlongitude = ECDlongitude,
                                  ECDlatitude = ECDlatitude,
                                  datLongitude = datLongitude,
                                  datLatitude = datLatitude)
  updated_distance_data <- unsplit(updated_distance_data, list(data$continent, data$species), drop = TRUE)
}
