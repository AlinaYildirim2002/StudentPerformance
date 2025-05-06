# Load necessary libraries
library(dplyr)
library(lubridate)
library(ggplot2)

#Compare Weekly Performance

compare_weekly <- function(data) {
  data %>%
    mutate(
      Date = as.Date(Date),
      Week = isoweek(Date),
      Percentage = calc_percentage(Score, Total)
    ) %>%
    group_by(Week) %>%
    summarize(AverageScore = mean(Percentage), .groups = "drop") %>%
    ggplot(aes(x = Week, y = AverageScore)) +
    geom_col(fill = "steelblue") +
    labs(title = "Weekly Average Score", x = "Week of Year", y = "Average % Score") +
    theme_minimal()
}

#' Compare Monthly Performance
#' @export
compare_monthly <- function(data) {
  data %>%
    mutate(
      Date = as.Date(Date),
      Month = month(Date, label = TRUE),
      Percentage = calc_percentage(Score, Total)
    ) %>%
    group_by(Month) %>%
    summarize(AverageScore = mean(Percentage), .groups = "drop") %>%
    ggplot(aes(x = Month, y = AverageScore)) +
    geom_col(fill = "darkorange") +
    labs(title = "Monthly Average Score", x = "Month", y = "Average % Score") +
    theme_minimal()
}


#Average score by course

average_score_by_course <- function(data) {
  aggregate(Score ~ Subject, data = data, FUN = mean)
}


#Total Study Hours by Course

total_study_hours_by_course <- function(data) {
  aggregate(StudyHours ~ Subject, data = data, sum)
}

#' Summary Statistics by Course
#' @export
course_summary_stats <- function(data) {
  stats <- aggregate(cbind(Score, StudyHours) ~ Subject, data = data, function(x) {
    c(mean = mean(x), median = median(x), min = min(x), max = max(x))
  })

  flat_stats <- do.call(data.frame, stats)
  colnames(flat_stats) <- c(
    "Subject",
    "Grade_Mean", "Grade_Median", "Grade_Min", "Grade_Max",
    "Hours_Mean", "Hours_Median", "Hours_Min", "Hours_Max"
  )

  return(flat_stats)
}
#After running that
#Run:
#source("R/analyze_trends.R")  # adjust if you're already in the Code folder
#student_data <- read_student_data("student_data.csv")
#compare_weekly(student_data)
#compare_monthly(student_data)
#average_score_by_course(student_data)
#total_study_hours_by_course(student_data)
#course_summary_stats(student_data)

