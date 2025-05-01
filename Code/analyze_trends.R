# Load necessary libraries
library(dplyr)
library(lubridate)
library(ggplot2)

#' Compare Weekly Performance
#' @export
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

#After running that
#Run:
#source("Code/analyze_trends.R")  # adjust if you're already in the Code folder
#student_data <- read_student_data("student_data.csv")
#compare_weekly(student_data)
#compare_monthly(student_data)

