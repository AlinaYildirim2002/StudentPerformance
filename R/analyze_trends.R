# Load necessary libraries
library(dplyr)
library(lubridate)
library(ggplot2)

# Declaring global variables to avoid R CMD errors
utils::globalVariables(c("Date", "Month", "Score", "Total", "Week", "Percentage", "AverageScore", "Subject"))

# Calculate Percentage
# We had to include more conditionals due to failed CMD checks
calc_percentage <- function(score, total) {
  if (is.numeric(score) && is.numeric(total) && length(score) == length(total)) {
    return((score / total) * 100)
  } else {
    stop("Both 'score' and 'total' must be numeric vectors of the same length.")
  }
}

#' Compare Weekly Performance
#'
#' This function compares the weekly performance of students.
#'
#' @param data A data frame containing student performance data.
#' @return A ggplot object showing weekly performance.
#' @export
compare_weekly <- function(data) {
  data %>%
    mutate(
      Date = as.Date(Date),
      Week = isoweek(Date),
      Percentage = calc_percentage(Score, Total)
    ) %>%
    group_by(Week) %>%
    summarize(AverageScore = mean(Percentage, na.rm = TRUE), .groups = "drop") %>%
    ggplot(aes(x = Week, y = AverageScore)) +
    geom_col(fill = "steelblue") +
    labs(title = "Weekly Average Score", x = "Week of Year", y = "Average % Score") +
    theme_minimal()
}

#' Compare Monthly Performance
#'
#' This function compares the monthly performance of students.
#'
#' @param data A data frame containing student performance data.
#' @return A ggplot object showing monthly performance.
#' @export
compare_monthly <- function(data) {
    required_columns <- c("Date", "Score", "Total")
    if (!all(required_columns %in% colnames(data))) {
        stop("Error: The data must contain the following columns: Date, Score, Total")
    }

    data %>%
        mutate(Date = as.Date(Date)) %>%
        mutate(Month = format(Date, "%Y-%m")) %>%
        group_by(Month) %>%
        summarize(
            AverageScore = mean(Score / Total * 100, na.rm = TRUE),
            .groups = "drop"
        ) %>%
        ggplot(aes(x = Month, y = AverageScore)) +
        geom_line(color = "steelblue") +
        labs(title = "Monthly Average Score", x = "Month", y = "Average % Score") +
        theme_minimal()
}

#' Average Score by Course
#'
#' This function calculates the average score for each course.
#'
#' @param data A data frame containing student performance data.
#' @return A data frame with average scores by course.
#' @export
average_score_by_course <- function(data) {
  aggregate(Score ~ Subject, data = data, FUN = mean)
}

#' Total Study Hours by Course
#'
#' This function calculates the total study hours for each course.
#'
#' @param data A data frame containing student performance data.
#' @return A data frame with total study hours by course.
#' @export
total_study_hours_by_course <- function(data) {
  aggregate(StudyHours ~ Subject, data = data, sum)
}

#' Summary Statistics by Course
#'
#' Summarize Score and StudyHours by Subject, returning mean, median, min, and max values.
#'
#' @param data A data frame with columns "Subject", "Score", and "StudyHours".
#' @return A data frame with summary statistics by course.
#' @export
course_summary_stats <- function(data) {
  stats <- aggregate(
    cbind(Score, StudyHours) ~ Subject,
    data = data,
    function(x) c(mean = mean(x), median = median(x), min = min(x), max = max(x))
  )

  # Flatten the nested structure
  flat_stats <- do.call(data.frame, stats)
  colnames(flat_stats) <- c(
    "Subject",
    "Grade_Mean",  "Grade_Median",  "Grade_Min",  "Grade_Max",
    "Hours_Mean",  "Hours_Median",  "Hours_Min",  "Hours_Max"
  )

  flat_stats
}
