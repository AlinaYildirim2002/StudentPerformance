#' Read Student Data
#'
#' Reads student performance data from a specified CSV file.
#'
#' @param path The file path to the student data CSV file. Defaults to "student_data.csv".
#' @return A data frame containing student performance data, with columns for Date, Subject, Category, Score, Total, StudyHours, and Semester.
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

#' Write Student Data
#'
#' Writes student performance data to a specified CSV file.
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
