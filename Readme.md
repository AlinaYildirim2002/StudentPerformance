
<!-- README.md is generated from README.Rmd. Please edit that file -->

# StudentPerformance

📘 Student Performance Tracker

Track and visualize academic performance over time with modular R
scripts. This project calculates GPA, plots weekly/monthly trends, and
tracks progress by subject and assignment type.

📂 Project Structure

StudentPerformance/ ├── Code/ │ ├── grade_calc.R \# Functions for
calculating % score, letter grade, GPA │ ├── make_initial_data.R \#
Script to create and export initial CSV data │ ├── data_io.R \#
Read/write functions for the student_data.csv file │ ├── update_data.R
\# Adds new entries to the dataset │ ├── metrics.R \# Adds percentage,
GPA, and cumulative GPA │ ├── analyze_trends.R \# Weekly/monthly
comparison plots │ ├── plots.R \# GPA and assignment-type visualizations
├── student_data.csv \# Main dataset storing student records └──
README.md \# Project overview and usage instructions

📊 Features

- **Calculate**: Percentage, Letter Grade, GPA, and Cumulative GPA
- **Update**: Append new rows to your dataset with a script
- **Analyze**: Weekly and monthly average score comparisons
- **Visualize**:
  - GPA Over Time
  - Cumulative GPA Progress
  - Average Score by Assignment Category

📦 Requirements

- R (≥ 4.0)
- R packages:
  - `dplyr`
  - `ggplot2`
  - `lubridate`

Install packages if needed:

``` r
install.packages(c("dplyr", "ggplot2", "lubridate"))
```

🚀 How to Use

1.  Installation

You can install the development version of StudentPerformance from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("AlinaYildirim2002/StudentPerformance")
```
2. Set Working Directory In R:

``` r
setwd("path/to/StudentPerformance")
```

3.  Run Core Scripts

``` r
source("Code/data_io.R")
source("Code/grade_calc.R")
source("Code/metrics.R")
source("Code/update_data.R")        
source("Code/analyze_trends.R")
source("Code/plots.R")
```

4.  Load & Enrich Data

``` r
student_data <- read_student_data()
student_data <- add_metrics(student_data)
```

5.  Run Comparisons or Plots

``` r
compare_weekly(student_data)
compare_monthly(student_data)

plot_gpa_over_time(student_data)
plot_cumulative_gpa(student_data)
plot_score_by_category(student_data)
```
🧠 Example Entry Added 

``` r
new_entry <- data.frame(
  Date = as.Date("2025-04-10"),
  Subject = "Math",
  Category = "Exam",
  Score = 88,
  Total = 100,
  StudyHours = 3.5,
  Semester = "Spring 2025"
)
```
🛠️ Future Ideas

- Add interactive Shiny dashboard
- Export PDF summary reports
- Handle multiple students

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/AlinaYildirim2002/StudentPerformance/graph/badge.svg)](https://app.codecov.io/gh/AlinaYildirim2002/StudentPerformance)
<!-- badges: end -->

The goal of StudentPerformance is to help students track and visualize
their grades, and compare class performance across subjects.



