#' Flag species names in the new dataset that do not occur in the ECD
#'
#' @param data new dataset
#' @param ECD Expert curated dataset
#' @param datSpecies species column name in new dataset
#' @param ECDspecies species column name in ECD
#'
#' @return
#' @export
#'
#' @examples
flag_names = function(data,
                      ECD,
                      datSpecies = "species",
                      ECDspecies = "species"){
  names <- data[[datSpecies]] %in% ECD[[ECDspecies]]
  data$.name <- names
  data[data$.name == FALSE, ".summary"] = FALSE
  return(data)
}


#' Title
#'
#' @param data new dataset
#' @param names name of column that indicates which observations need a name change
#' @param species species column name in dataset
#'
#' @return
#' @export
#'
#' @examples
change_flagged_names <- function(data,
                                 names = ".name",
                                 species = "species"){
  data <- data[data[[names]] == FALSE,]
  newNames <- taxize::gnr_resolve(sci = data[[species]], canonical = T, best_match_only = T)
  return(newNames$matched_name2)
}
