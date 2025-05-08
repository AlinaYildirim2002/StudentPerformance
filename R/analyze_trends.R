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
#'
#' @param data A data frame containing student performance data.
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
#' Summarize Score and StudyHours by Subject, returning mean, median, min, and max values.
#'
#' @param data A data.frame with columns \code{Subject}, \code{Score}, and \code{StudyHours}.
#' @return A data.frame with one row per Subject and columns:
#'   \itemize{
#'     \item \code{Subject}
#'     \item \code{Grade_Mean}, \code{Grade_Median}, \code{Grade_Min}, \code{Grade_Max}
#'     \item \code{Hours_Mean}, \code{Hours_Median}, \code{Hours_Min}, \code{Hours_Max}
#'   }
#' @examples
#' course_summary_stats(
#'   data.frame(
#'     Subject    = c("Math", "Eng", "Sci"),
#'     Score      = c(85, 78, 92),
#'     StudyHours = c(5, 4, 7)
#'   )
#' )
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
