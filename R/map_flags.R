#' Helper function to map occurences
#'
#' @param data dataset passed from flags_for_map
#'
#' @return Returns a string indicating whether the observation has no flags, two flags, or which single flag
#'
.map_helper <- function(data){
  flagName <- names(data[which((data) == FALSE)])
  if(length(flagName) == 0) flagName = "No Flag"
  if(length(flagName) > 1) flagName = ">1 Flags"
  return(flagName)
}

#' function for preparing data to be mapped by map_flags
#'
#' @param data new dataset
#' @param pattern pattern to index columns that indicate flags
#' @param summaryCol column that indicates whether or not an occurence has any flags
#'
#' @return dataframe with new plotNum column used in the curator::map_flags function
#' @export
#'
#' @examples flags_for_map(curator::obsData)
#'
flags_for_map <- function(data,
                          pattern = "^\\.",
                          summaryCol = ".summary"){
  dataNew <- data[, grepl(pattern, names(data))]
  dataNew <- dataNew[, !names(dataNew) == summaryCol]
  plotNum <-  apply(dataNew, MARGIN = 1, FUN = .map_helper)
  data$plotNum= plotNum

  return(data)
}


# GOAL 7: MAP FLAGGED AND UNFLAGGED SPECIES -------------------------------
#' Title
#'
#' @param data data for plotting
#' @param longitude longitude column name
#' @param latitude latitude column name
#' @param plotValues column that indicates flag state of occurence
#'
#' @return No return value: plots a leaflet map
#' @export
#'
#' @examples
#' data = flags_for_map(obsData)
#' map_flags(data)
#'
map_flags <- function(data,
                      longitude = "decimalLongitude",
                      latitude = "decimalLatitude",
                      plotValues = "plotNum"){

  df <- data.frame(longitude = data[[longitude]],
                   latitude = data[[latitude]],
                   flags = data[[plotValues]])
  pal <- leaflet::colorFactor(
    palette = c("orange", "blue"),
    domain = df$sum)

  map = leaflet::leaflet(df)
  map = leaflet::addCircleMarkers(map, color = ~pal(flags),
                                   fillOpacity = 0.5,
                                   label = ~df$flags,
                                   radius = 3)
  map = leaflet::addTiles(map)
  print(map)
}


#' Function to map ECD observations and new data observations
#'
#' @param data new data for plotting
#' @param ECD Expert curated data set for plotting
#' @param datLongitude New data column name of column that contains longitude coordinates
#' @param datLatitude New data column name of column that contains latitude coordinates
#' @param ECDLongitude ECD column name of column that contains longitude coordinates
#' @param ECDLatitude ECD column name of column that contains latitude coordinates
#'
#' @return No return value: plots a leaflet map
#' @export
#'
#' @examples
#' map_obs_and_ECD(obsData, ECD)
#'
#'
map_obs_and_ECD <- function(data,
                            ECD,
                      datLongitude = "decimalLongitude",
                      datLatitude = "decimalLatitude",
                      ECDLongitude = "decimalLongitude",
                      ECDLatitude = "decimalLatitude"
                      ){

  data$type = 'obs'
  ECD$type = 'ECD'
  ECD <- ECD[ECD$species %in% data$species,]

  df <- rbind(data[c(datLongitude, datLatitude, "type")],
        ECD[c(ECDLongitude, ECDLatitude, 'type')])

  colnames(df) = c("Longitude", "Latitude", "type")
  df[,1] = as.numeric(df[,1])
  df[,2] = as.numeric(df[,2])

  pal <- leaflet::colorFactor(
    palette = c("orange", "blue"),
    domain = df$sum)

  map = leaflet::leaflet(df)
  map = leaflet::addCircleMarkers(map, color = ~pal(type),
                                  fillOpacity = 0.5,
                                  label = ~df$type,
                                  radius = 3)
  map = leaflet::addTiles(map)
  print(map)
}



