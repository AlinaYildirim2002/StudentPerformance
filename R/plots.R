library(ggplot2)
library(dplyr)

# GPA Over Time
plot_gpa_over_time <- function(data) {
  ggplot(data, aes(x = as.Date(Date), y = GPA)) +
    geom_line(color = "purple") +
    geom_point() +
    labs(title = "GPA Over Time", x = "Date", y = "GPA") +
    theme_minimal()
}

# Cumulative GPA
plot_cumulative_gpa <- function(data) {
  ggplot(data, aes(x = as.Date(Date), y = CumulativeGPA)) +
    geom_line(color = "darkgreen") +
    labs(title = "Cumulative GPA Progress", x = "Date", y = "Cumulative GPA") +
    theme_minimal()
}

# Score by Category
plot_score_by_category <- function(data) {
  data %>%
    group_by(Category) %>%
    summarize(Average = mean(Percentage)) %>%
    ggplot(aes(x = Category, y = Average, fill = Category)) +
    geom_col() +
    labs(title = "Average Score by Assignment Type", x = "Category", y = "Average %") +
    theme_minimal()
}

# Hours vs score
plot_hours_vs_score <- function(data) {
  ggplot(data, aes(x = StudyHours, y = Score, color = Subject)) +
    geom_point(size = 3, alpha = 0.7) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = "Study Hours vs. Score by Subject", x = "Study Hours", y = "Score") +
    theme_minimal()
}

#Then run in console:
# Run all your plots
#plot_gpa_over_time(student_data)
#plot_cumulative_gpa(student_data)
#plot_score_by_category(student_data)
#plot_study_hours_vs_score(student_data)
