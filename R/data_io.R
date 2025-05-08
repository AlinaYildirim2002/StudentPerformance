#' @title Read Student Data
#' @description
#' Load student performance data from a CSV file (default `"student_data.csv"`).
#' If the file is missing, returns an empty data.frame with the expected columns.
#'
#' @return A data.frame with columns Date, Subject, Category, Score, Total, StudyHours, Semester.
#' @examples
#' read_student_data()
#' @export
read_student_data <- function(path = "student_data.csv") {
  if (file.exists(path)) {
    read.csv(path, stringsAsFactors = FALSE)
  } else {
    data.frame(
      Date       = as.Date(character()),
      Subject    = character(),
      Category   = character(),
      Score      = numeric(),
      Total      = numeric(),
      StudyHours = numeric(),
      Semester   = character(),
      stringsAsFactors = FALSE
    )
  }
}

# Write Student Data

write_student_data <- function(data, path = "student_data.csv") {
  write.csv(data, path, row.names = FALSE)
}



# weekly, monthly comparison, plots



