#' Flag species labeled as "introduced"
#'
#' @param data dataset
#' @param introCol name of column that contains introduced species labels
#' @param introTitle Label of introduced species
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


#' Flag species labeled as "deleted"
#'
#' @param data dataset
#' @param delCol name of column that contains introduced species labels
#' @param delTitle Label of deleted species
#'
#' @return dataset of the same class passed to it. New column of introduced flags
#' @export
#'
#' @examples
flag_deleted <- function(data,
                         delCol = "databaseChanges",
                         delTitle = "deleted"){
  deleted = data[delCol] != delTitle
  data$.deleted = deleted
  data[data$.deleted == FALSE, ".summary"] = FALSE
  return(data)
}
