# Load the data
student_data <- read.csv("student_data.csv")

# Make a basic plot (Score vs. Date)
plot(
  as.Date(student_data$Date),    # x-axis: Date
  student_data$Score,            # y-axis: Score
  type = "b",                    # "b" = both points and lines
  col = "blue",                  # make it blue
  pch = 19,                      # solid circle points
  xlab = "Date",
  ylab = "Score",
  main = "Student Scores Over Time"
)

