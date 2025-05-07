test_that("average_score_by_course computes correct average", {
  sample_data <- data.frame(
    Subject = c("Math", "Math", "History", "History"),
    Score = c(80, 90, 70, 60)
  )

  result <- average_score_by_course(sample_data)

  # We expect the mean score for Math to be 85, and for History to be 65
  expect_equal(result$Score[result$Subject == "Math"], 85)
  expect_equal(result$Score[result$Subject == "History"], 65)
})
