#' Calculate Percentage Score
#' @export
calc_percentage <- function(score, total) {
  round(score / total * 100, 2)
}

#' Map Percentage to Letter Grade
#' @export
letter_grade <- function(percentage) {
  cut(percentage, breaks = c(-Inf, 60, 70, 80, 90, 100),
      labels = c("F", "D", "C", "B", "A"))
}

#' Convert Percentage to GPA
#' @export
calc_gpa <- function(percentage) {
  dplyr::case_when(
    percentage >= 90 ~ 4.0,
    percentage >= 80 ~ 3.0,
    percentage >= 70 ~ 2.0,
    percentage >= 60 ~ 1.0,
    TRUE ~ 0.0
  )
}

