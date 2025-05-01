
# Create a sample student dataset
initial_data <- data.frame(
  Date = as.Date(c("2025-03-01", "2025-03-05", "2025-03-10")),
  Subject = c("Math", "Biology", "Physik"),
  Category = c("Homework", "Exam", "Project"),
  Score = c(85, 90, 92),
  Total = c(100, 100, 100),
  StudyHours = c(2, 4, 3),
  Semester = c("Spring 2025")

)


# Save it in my project folder
write.csv(initial_data, "student_data.csv", row.names = FALSE)




