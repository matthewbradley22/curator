#' Title
#'
#' @param startingYear
#' @param taxKey
#'
#' @return
#' @export
#'
#' @examples
#'
num_obs <- function(startingYear,
                    taxKey){

  total = rgbif::occ_count(year = startingYear, taxonKey = taxKey)
  return(total)

}



#' retrieve records from gbif, wrapper around occ_search
#'
#' @param startingMonth Starting month of starting year for retrieving data
#' @param startingYear Starting year for retrieving data
#' @param name Scientific name from the GBIF backbone
#' @param taxKey Gbif taxon  key
#' @param genKey Gbif genus key
#' @param numObs How many observations should be pulled from Gbif
#' @param coordinate Return only records with lat and lon data
#'
#' @return returns a dataframe with biological data from Gbif
#' @export
#'
#' @examples get_records_since_date()
occ_since <- function(startingMonth = 6,
                                   startingYear = 2021,
                                   name = NULL,
                                   taxKey = 2721893,
                                   genKey = NULL,
                                   numObs = NULL,
                                   coordinate = TRUE){

  curYear = format(Sys.Date(), "%Y")
  rangeYears = paste(startingYear, curYear, sep = ", ")

  if(is.null(numObs)){
    numObs = Reduce("+", lapply(X = seq(startingYear, curYear),
                                num_obs,
                                taxKey = taxKey))
  }
  search = rgbif::occ_search(scientificName = name,
                      year = rangeYears,
                      limit = numObs,
                      hasCoordinate = coordinate,
                      taxonKey = taxKey,
                      genusKey = genKey)
  data <- search$data
  data <- data[!(data$year == startingYear & data$month < startingMonth),]
  data$countryCode <-  countrycode::countrycode(data$countryCode, origin =  'iso2c', destination = 'iso3c')
  data <- data[!is.na(data$species),]
  return(data)
}



#' flag data using coordinate_cleaner
#'
#' @param data biological data to be flagged
#'
#' @return returns a dataframe with included flags
#' @export
#'
#' @examples
#' obsData <- data.frame(obsData[1:5])
#' flag_data(obsData)
#'
flag_data <- function(data){

  flags <- CoordinateCleaner::clean_coordinates(x = data,
                             lon = "decimalLongitude",
                             lat = "decimalLatitude",
                             countries = "countryCode",
                             species = "species")

  return(flags)
}
