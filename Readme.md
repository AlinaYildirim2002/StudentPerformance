# StudentPerformance 📘

Track and visualize academic performance over time with modular R scripts. This project calculates GPA, provides summary statistics, and tracks progress by subject and assignment type.

## 📂 Project Structure

```
StudentPerformance/  
├── R/  
│   ├── grade_calc.R # Functions for calculating % score, letter grade, GPA  
│   ├── make_initial_data.R # Script to create and export initial CSV data  
│   ├── data_io.R # Read/write functions for the student_data.csv file  
│   ├── update_data.R # Adds new entries to the dataset  
│   ├── metrics.R # Adds percentage, GPA, and cumulative GPA  
│   ├── analyze_trends.R # Weekly and Monthly trend analysis  
├── student_data.csv # Main dataset storing student records  
└── README.md # Project overview and usage instructions  
```

## 📊 Features

* **Calculate:** Percentage, Letter Grade, GPA, and Cumulative GPA
* **Update:** Append new rows to your dataset with a script
* **Analyze:** Weekly and monthly average score comparisons
* **Visualize:** GPA Over Time, Average Score by Assignment Category

## 📦 Requirements

* R (≥ 4.0)
* R packages:

  * dplyr
  * ggplot2
  * lubridate

Install packages if needed:

```r
install.packages(c("dplyr", "ggplot2", "lubridate"))
```

## 🚀 How to Use

### Installation

You can install the development version of StudentPerformance from GitHub with:

```r
# install.packages("devtools")
devtools::install_github("AlinaYildirim2002/StudentPerformance")
```

### Set Working Directory in R

```r
setwd("path/to/StudentPerformance")
```

### Run Core Scripts

```r
devtools::load_all()
```

### Load & Enrich Data

```r
student_data <- read_student_data()
student_data <- add_metrics(student_data)
```

### Run Summary Statistics

```r
course_summary_stats(student_data)
compare_monthly(student_data)
```

### Save Your Data

```r
write_student_data(student_data, "updated_student_data.csv")
```

## 🛠️ Future Ideas

* Add interactive Shiny dashboard
* Export PDF summary reports
* Handle multiple students
* Improve test coverage

The goal of **StudentPerformance** is to help students track and visualize their grades and compare class performance across subjects.
