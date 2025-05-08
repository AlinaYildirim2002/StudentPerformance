# Calculate Percentage Score

calc_percentage <- function(score, total) {
  round(score / total * 100, 2)
}

# Map Percentage to Letter Grade
letter_grade <- function(percentage) {
  cut(percentage, breaks = c(-Inf, 60, 70, 80, 90, 100),
      labels = c("F", "D", "C", "B", "A"))
}


#' @title Convert Percentage to GPA
#' @description
#' Translate a numeric percentage (0–100) into a 4.0-scale GPA.
#'
#' @param percentage Numeric vector of percentages.
#' @return Numeric vector of GPAs (0.0–4.0) corresponding to each input percentage.
#' @examples
#' calc_gpa(c(92, 85, 74, 59))
#'
#' @importFrom dplyr case_when
#' @export
calc_gpa <- function(percentage) {
  dplyr::case_when(
    percentage >= 90 ~ 4.0,
    percentage >= 80 ~ 3.0,
    percentage >= 70 ~ 2.0,
    percentage >= 60 ~ 1.0,
    TRUE             ~ 0.0
  )
}

