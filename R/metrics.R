#' @title Add Computed Metrics
#' @description
#' (Internal) Given a student data frame, add three columns:
#'  \itemize{
#'    \item \code{Percentage} = Score/Total * 100
#'    \item \code{GPA} via \code{calc_gpa()}
#'    \item \code{CumulativeGPA} via \code{cummean()}
#'  }
#' @param data A data.frame with \code{Score} and \code{Total} columns.
#' @return The same data.frame with new columns \code{Percentage}, \code{GPA}, and \code{CumulativeGPA}.
#' @keywords internal
#' @importFrom dplyr cummean
add_metrics <- function(data) {
  data$Percentage <- calc_percentage(data$Score, data$Total)
  data$GPA <- calc_gpa(data$Percentage)
  data$CumulativeGPA <- dplyr::cummean(data$GPA)
  return(data)
}
