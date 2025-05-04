library(testthat)

# Load the function definitions
source("grade_calc.R")

test_that("calc_percentage calculates correct values", {
  expect_equal(calc_percentage(50, 100), 50)
  expect_equal(calc_percentage(25, 50), 50)
  expect_equal(calc_percentage(0, 100), 0)
})

test_that("letter_grade returns correct grades", {
  expect_equal(as.character(letter_grade(95)), "A")
  expect_equal(as.character(letter_grade(85)), "B")
  expect_equal(as.character(letter_grade(75)), "C")
  expect_equal(as.character(letter_grade(65)), "D")
})

test_that("calc_gpa returns correct GPA", {
  expect_equal(calc_gpa(95), 4.0)
  expect_equal(calc_gpa(85), 3.0)
  expect_equal(calc_gpa(75), 2.0)
  expect_equal(calc_gpa(65), 1.0)
  expect_equal(calc_gpa(50), 0.0)
})
