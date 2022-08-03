#' Remove any flagged data from dataset
#'
#' @param data name of dataset
#' @param sumName name of column that summarizes flags, ie row values in column indicates if data is flagged or not
#'
#' @return dataset of the same type passed to it, but with all flagged data removed
#' @export
#'
#' @examples
#'
rm_flag_data <- function(data,
                         sumName = ".summary"){
  newDat = data[data[[sumName]] == T,]
  return(newDat)
}


#' Function to combine new data and ECD into one dataframe
#'
#' @param data dataset with new occurence data
#' @param ECD Expert curated dataset
#'
#' @return
#' @export
#'
#' @examples
combine <- function(data,
                    ECD){

}
