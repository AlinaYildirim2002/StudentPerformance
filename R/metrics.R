add_metrics <- function(data) {
  data$Percentage <- calc_percentage(data$Score, data$Total)
  data$GPA <- calc_gpa(data$Percentage)
  data$CumulativeGPA <- cummean(data$GPA)
  return(data)
}


