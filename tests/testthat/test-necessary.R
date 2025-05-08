library(testthat)
library(StudentPerformance)
# Test calc_gpa()
test_that("calc_gpa() computes correct GPA", {
  percentages <- c(95, 85, 75, 65, 55)
  expect_equal(calc_gpa(percentages), c(4.0, 3.0, 2.0, 1.0, 0.0))

  # Test edge cases
  expect_equal(calc_gpa(c(90, 100)), c(4.0, 4.0))
  expect_equal(calc_gpa(c(89, 79, 69, 59)), c(3.0, 2.0, 1.0, 0.0))

  # Test empty input
  expect_equal(calc_gpa(numeric()), numeric())
})


# Test course_summary_stats()
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

  # Test with empty data frame (should error)
  expect_error(course_summary_stats(data.frame()))

  # Test with non-numeric column (should error)
  expect_error(course_summary_stats(data.frame(Score = c("A", "B", "C"), StudyHours = c("X", "Y", "Z"))))
})

# Test read_student_data()
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

  # Test with non-existent file (should return empty data frame)
  expect_equal(nrow(read_student_data("non_existent.csv")), 0)

  # Clean up test file
  file.remove(sample_data)
})
