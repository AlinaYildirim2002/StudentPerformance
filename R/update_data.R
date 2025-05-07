source("R/data_io.R")

student_data <- read_student_data()

new_entry <- data.frame(
  Date = as.Date("2025-04-01"),
  Subject = "Math",
  Category = "Exam",
  Score = 88,
  Total = 100,
  StudyHours = 3.5,
  Semester = "Spring 2025",
  stringsAsFactors = FALSE
)

new_entries <- data.frame(
  Date = as.Date(c("2025-04-04", "2025-04-10", "2025-04-15")),
  Subject = c("Biology", "Math", "Physics"),
  Category = c("Project", "Exam", "Homework"),
  Score = c(91, 76, 88),
  Total = c(100, 100, 100),
  StudyHours = c(3.5, 2.5, 4),
  Semester = c("Spring 2025", "Spring 2025", "Spring 2025"),
  stringsAsFactors = FALSE
)

updated_data <- rbind(student_data, new_entries)
write_student_data(updated_data)


updated_data <- rbind(student_data, new_entry)
write_student_data(updated_data)

#After running save it and run: source("R/update_data.R")
