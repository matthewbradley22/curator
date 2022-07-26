#' Helper function to map occurences
#'
#' @param data dataset passed from flags_for_map
#'
#' @return
#' @export
#'
#' @examples
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
#' @return
#' @export
#'
#' @examples
flags_for_map <- function(data,
                          pattern = "^\\.",
                          summaryCol = ".summary"){
  data <- data[, grepl(pattern, names(data))]
  data <- data[, !names(data) == summaryCol]
  plotNum <-  apply(data, MARGIN = 1, FUN = .map_helper)

  return(plotNum)
}


# GOAL 7: MAP FLAGGED AND UNFLAGGED SPECIES -------------------------------
#' Title
#'
#' @param data data for plotting
#' @param longitude longitude column name
#' @param latitude latitude column name
#' @param plotValues column that indicates flag state of occurence
#'
#' @return
#' @export
#'
#' @examples
map_flags <- function(data,
                      longitude = "decimalLongitude",
                      latitude = "decimalLatitude",
                      plotValues = "plotNum"){

  df <- data.frame(longitude = flags[[longitude]],
                   latitude = flags[[latitude]],
                   flags = flags[[plotValues]])
  pal <- colorFactor(
    palette = c("orange", "blue"),
    domain = df$sum)

  leaflet(df) %>% addCircleMarkers(color = ~pal(flags),
                                   fillOpacity = 1,
                                   label = ~df$flags,
                                   radius = 3) %>%
    addTiles()
}
