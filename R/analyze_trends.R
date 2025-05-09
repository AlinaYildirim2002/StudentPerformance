##Compare Monthly

#' @title Compare Monthly Performance
#' @description
#' Take a data.frame that has
#' \code{Date} (any date or date‐time column),
#' \code{Score} (points earned) and
#' \code{Total} (points possible),
#' compute each month’s average percent score, and draw a bar chart.
#'
#' @param data A data.frame with columns \code{Date}, \code{Score}, \code{Total}.
#' @importFrom magrittr %>%
#' @importFrom ggplot2 ggplot aes geom_line geom_point labs theme_minimal
#' @importFrom dplyr mutate group_by summarize
#' @importFrom lubridate month
#' @return A ggplot bar chart (months on the x-axis, average percent on the y-axis).
#' @examples
#' compare_monthly(
#'   data.frame(
#'     Date  = as.Date(c("2025-01-01", "2025-01-15")),
#'     Score = c(50, 100),
#'     Total = c(100, 100)
#'   )
#' )
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



## Summary Stats
#' @title Summary Statistics by Course
#' @description Summarize Score and StudyHours by Subject, returning mean, median, min, and max values.
#'
#' @importFrom stats aggregate median
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

  # Flatten the nested structure
  flat_stats <- do.call(data.frame, stats)
  colnames(flat_stats) <- c(
    "Subject",
    "Grade_Mean",  "Grade_Median",  "Grade_Min",  "Grade_Max",
    "Hours_Mean",  "Hours_Median",  "Hours_Min",  "Hours_Max"
  )

  flat_stats
}
