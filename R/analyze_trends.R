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


#' @title Compare Monthly Performance
#' @description
#' Take a data.frame that has
#' \code{Date} (any date or date‐time column),
#' \code{Score} (points earned) and
#' \code{Total} (points possible),
#' compute each month’s average percent score, and draw a bar chart.
#'
#' @return A ggplot bar chart (months on the x-axis, average percent on the y-axis).
#' @examples
#' compare_monthly(data)
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

#' @title Summary Statistics by Course
#' @description
#' Take a data.frame with \code{Subject}, \code{Score} and \code{StudyHours},
#' compute mean, median, min and max of each by \code{Subject}, and return the results.
#'
#' @return A data.frame of summary stats (mean, median, min, max) for Score and StudyHours by Subject.
#' @examples
#' course_summary_stats(
#'   data.frame(
#'     Subject    = c("Math", "Eng", "Sci"),
#'     Score      = c(85, 78, 92),
#'     StudyHours = c(5, 4, 7)
#'   )
#' )
#' course_summary_stats(data.frame)
#' @export
course_summary_stats <- function(data) {
  stats <- aggregate(
    cbind(Score, StudyHours) ~ Subject,
    data = data,
    function(x) c(mean = mean(x), median = median(x), min = min(x), max = max(x))
  )

  flat_stats <- do.call(data.frame, stats)
  colnames(flat_stats) <- c(
    "Subject",
    "Grade_Mean",  "Grade_Median",  "Grade_Min",  "Grade_Max",
    "Hours_Mean",  "Hours_Median",  "Hours_Min",  "Hours_Max"
  )

  flat_stats
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


