library(testthat)


test_that("read_student_data handles missing files", {
  temp_file <- tempfile()
  result <- read_student_data(temp_file)
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 7)
})

test_that("read_student_data reads existing files correctly", {
  temp_file <- tempfile()
  sample_data <- data.frame(
    Date = as.Date("2025-04-01"),
    Subject = "Math",
    Category = "Exam",
    Score = 88,
    Total = 100,
    StudyHours = 3.5,
    Semester = "Spring 2025",
    stringsAsFactors = FALSE
  )
  write_student_data(sample_data, temp_file)
  result <- read_student_data(temp_file)
  expect_equal(nrow(result), 1)
  expect_equal(result$Subject[1], "Math")
})

test_that("write_student_data writes correctly", {
  temp_file <- tempfile()
  sample_data <- data.frame(
    Date = as.Date("2025-04-01"),
    Subject = "Math",
    Category = "Exam",
    Score = 88,
    Total = 100,
    StudyHours = 3.5,
    Semester = "Spring 2025",
    stringsAsFactors = FALSE
  )
  write_student_data(sample_data, temp_file)
  read_back <- read_student_data(temp_file)
  expect_equal(nrow(read_back), 1)
  expect_equal(read_back$Score[1], 88)
})
