library(testthat)
library(StudentPerformance)
library(ggplot2)  #We have to load ggplot2 explicitly to avoid errors

# Testing calc_gpa()
test_that("calc_gpa() computes correct GPA", {
  percentages <- c(95, 85, 75, 65, 55)
  expect_equal(calc_gpa(percentages), c(4.0, 3.0, 2.0, 1.0, 0.0))

  # Testing edge cases
  expect_equal(calc_gpa(c(90, 100)), c(4.0, 4.0))
  expect_equal(calc_gpa(c(89, 79, 69, 59)), c(3.0, 2.0, 1.0, 0.0))

  # Testing empty input
  expect_equal(calc_gpa(numeric()), numeric())
})

# Testing compare_monthly()
test_that("compare_monthly() returns correct monthly averages", {
  data <- data.frame(
    Date = as.Date(c("2025-01-15", "2025-02-15", "2025-03-15", "2025-04-15")),
    Score = c(85, 90, 95, 100),
    Total = c(100, 100, 100, 100)
  )

  # Testing valid data
  result <- compare_monthly(data)
  expect_s3_class(result, "gg")  # Check if the result is a ggplot object

  # Testing with empty data (should error)
  expect_error(compare_monthly(data.frame()), "must contain the following columns")

  # Testing with missing columns
  expect_error(compare_monthly(data.frame(Date = as.Date(c("2025-01-15")))), "must contain the following columns")
})

# Testing course_summary_stats()
test_that("course_summary_stats() calculates correct stats", {
  data <- data.frame(
    Subject = c("Math", "Biology", "Physics"),
    Score = c(90, 85, 92),
    StudyHours = c(4, 3, 5)
  )

  result <- course_summary_stats(data)
  expect_equal(nrow(result), 3)
  expect_equal(ncol(result), 9)
  expect_true(all(c("Grade_Mean", "Hours_Mean") %in% colnames(result)))

  # Testing with empty data frame with required columns (should error)
  expect_error(course_summary_stats(data.frame(Subject = character(), Score = numeric(), StudyHours = numeric())), "no rows to aggregate")

})

# Testing read_student_data()
test_that("read_student_data() reads data correctly", {
  sample_data <- "sample_student_data.csv"
  write.csv(data.frame(
    Date = as.Date(c("2025-01-15", "2025-02-15")),
    Subject = c("Math", "Biology"),
    Category = c("Exam", "Homework"),
    Score = c(95, 88),
    Total = c(100, 100),
    StudyHours = c(4, 3),
    Semester = c("Spring 2025", "Spring 2025")
  ), sample_data, row.names = FALSE)

  df <- read_student_data(sample_data)
  expect_equal(nrow(df), 2)
  expect_equal(ncol(df), 7)
  expect_equal(df$Subject[1], "Math")

  # Testing with non-existent file (should return empty data frame)
  empty_df <- read_student_data("non_existent.csv")
  expect_equal(nrow(empty_df), 0)
  expect_equal(ncol(empty_df), 7)

  # Cleaning up test file
  file.remove(sample_data)
})
