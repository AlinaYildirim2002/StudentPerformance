
##Read Student Data
#' @title Read Student Data
#' @description
#' Load student performance data from a CSV file (default `"student_data.csv"`).
#' If the file is missing, returns an empty data.frame with the expected columns.
#'
#' @param path Character scalar: path to the CSV file (default \"student_data.csv\").
#' @importFrom utils read.csv write.csv
#' @return A data.frame with columns Date, Subject, Category, Score, Total, StudyHours, Semester.
#' @examples
#' read_student_data()
#' @export
read_student_data <- function(path = "student_data.csv") {
  if (file.exists(path)) {
    read.csv(path, stringsAsFactors = FALSE)
  } else {
    data.frame(
      Date = as.Date(character()),
      Subject = character(),
      Category = character(),
      Score = numeric(),
      Total = numeric(),
      StudyHours = numeric(),
      Semester = character(),
      stringsAsFactors = FALSE
    )
  }
}
## Write Student Data

#' @title Write Student Data
#' @description Writes student performance data to a specified CSV file.
#'
#' @param data A data frame containing student performance data.
#' @param path The file path to save the student data CSV file. Defaults to "student_data.csv".
#' @export
write_student_data <- function(data, path = "student_data.csv") {
  if (!is.data.frame(data)) {
    stop("Error: The 'data' argument must be a data frame.")
  }
  write.csv(data, path, row.names = FALSE)
}


