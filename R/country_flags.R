
#' Helper function to flag occurences where species name is not found in continent in the Expert
#' curated dataset
#'
#' @param data Dataset with observations
#' @param ECD Expert curated dataset
#' @param ECDspecies Species column name in ECD
#' @param datSpecies Species column name in  dataset with observations
#' @param ECDcountry Country column name in ECD
#' @param datCountry Country column name in dataset with observations
#'
#' @return dataset with country flags column
#' @export
#'
#' @examples
#'
.flag_countries_helper <- function(data,
                                   ECD,
                                   ECDspecies,
                                   datSpecies,
                                   ECDcountry,
                                   datCountry){

  species_ECD <- ECD[ECD[[ECDspecies]] %in% unique(data[[datSpecies]]),]
  if (dim(species_ECD)[1] != 0) {
    species_ECD[[ECDcountry]] <- countrycode::countrycode(species_ECD[[ECDcountry]],
                                             origin =  'iso2c',
                                             destination = 'iso3c',
                                             nomatch = NULL)

    validCountries <- unique(species_ECD[[ECDcountry]])
    validCountries <- countrycode::countrycode(validCountries, origin =  'iso2c', destination = 'iso3c', nomatch = NULL)
    validCountries <- validCountries[validCountries != ""]
    countryFlags <- data[[datCountry]] %in% validCountries
    data$.country = countryFlags
    data[data$.country == FALSE, ".summary"] = FALSE
  }

  #What do we want to do if country not in ECD
  else{
    data$.country = TRUE
    data[data$.country == FALSE, ".summary"] = FALSE
  }
  return(data)
}

#pass flags dataset for data
#' Title
#'
#' @param data dataset with observations
#' @param ECD Expert curated dataset
#' @param ECDspecies Species column name in ECD
#' @param datSpecies Species column name in  dataset with observations
#' @param ECDcountry Country column name in ECD
#' @param datCountry Country column name in dataset with observations
#'
#' @return dataset with country flags column
#' @export
#'
#' @examples
#'
flag_countries <- function(data,
                           ECD,
                           datSpecies = "species",
                           ECDspecies = "species",
                           ECDcountry = "countryCode",
                           datCountry = "countryCode"){
  #fails if any species names are NA
  species_data <- split(data, data[[datSpecies]])
  updated_species_data <- lapply(species_data,
                                 .flag_countries_helper,
                                 ECD = ECD,
                                 ECDspecies = ECDspecies,
                                 datSpecies = datSpecies,
                                 ECDcountry = ECDcountry,
                                 datCountry = datCountry)
  updated_species_data <- unsplit(updated_species_data, data$species)
  return(updated_species_data)
}
