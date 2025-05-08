#' Read Student Data
#'
#' @param path The path to the CSV file containing student data.
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



