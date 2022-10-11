#' Flag species labeled as "introduced"
#'
#' @param data dataset
#' @param introCol name of column that contains introduced species labels
#'
#' @return dataset of the same class passed to it. New column of introduced flags
#' @export
#'
#' @examples
flag_introduced <- function(data,
                            introCol = "databaseChanges",
                            introTitle = "introduced"){
  introduced = data[introCol] != introTitle
  data$.introduced = introduced
  data[data$.introduced == FALSE, ".summary"] = FALSE
  return(data)
}
