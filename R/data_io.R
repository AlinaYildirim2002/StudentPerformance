#' Read Student Data
#'
#' Reads student performance data from a specified CSV file.
#'
#' @param path The file path to the student data CSV. Defaults to "student_data.csv".
#' @return A data frame with student performance data.
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

# Write Student Data

write_student_data <- function(data, path = "student_data.csv") {
  write.csv(data, path, row.names = FALSE)
}



