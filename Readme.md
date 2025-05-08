
<!-- README.md is generated from README.Rmd. Please edit that file -->

# StudentPerformance

<!-- badges: start -->

[![R-CMD-check](https://github.com/AlinaYildirim2002/StudentPerformance/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AlinaYildirim2002/StudentPerformance/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/AlinaYildirim2002/StudentPerformance/graph/badge.svg)](https://app.codecov.io/gh/AlinaYildirim2002/StudentPerformance)
<!-- badges: end --> 📘 **Student Performance Tracker**

Track and summarize academic performance with modular R functions. This
package provides:

- **calc_gpa()**: Convert percentage scores to a 4.0 GPA scale.
- **read_student_data()**: Load (or initialize) your `student_data.csv`
  into R.
- **compare_monthly()**: Plot monthly average percentage scores.
- **course_summary_stats()**: Generate mean/median/min/max summaries of
  Score and StudyHours by Subject.

## 📦 Installation

``` r
# install.packages("devtools")
devtools::install_github("AlinaYildirim2002/StudentPerformance")

Install the development version from GitHub:


## 🚀 Quick Start


``` r


# Load your data (or get an empty template)
student_data <- read_student_data("student_data.csv")

# Visualize monthly trends
compare_monthly(student_data)

# Get summary statistics by course
course_summary_stats(student_data)
```

## 🧠 Add Sample Entry

``` r
new_entry <- data.frame(
  Date       = as.Date("2025-04-10"),
  Subject    = "Math",
  Category   = "Exam",
  Score      = 88,
  Total      = 100,
  StudyHours = 3.5,
  Semester   = "Spring 2025"
)
```

Run `read_student_data()` again or write back with your own I/O function
to include `new_entry` in the CSV.

## 🛠️ Future Ideas

- Interactive Shiny dashboard
- PDF summary reports
- Multi‑student support

> **Goal:** Help students and educators track, compare, and visualize
> academic performance with a few simple R commands.
