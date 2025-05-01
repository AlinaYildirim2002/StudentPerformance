source("Code/grade_calc.R")

add_metrics <- function(data) {
  data$Percentage <- calc_percentage(data$Score, data$Total)
  data$GPA <- calc_gpa(data$Percentage)
  data$CumulativeGPA <- cummean(data$GPA)
  return(data)
}

#Then run in console:
#source("Code/metrics.R")
#student_data <- read_student_data()
#student_data <- add_metrics(student_data)
