# data-raw/student_data.R


csv_text <- '
Date,Subject,Category,Score,Total,StudyHours,Semester
2025-03-01,Math,Homework,85,100,2,Spring 2025
2025-03-05,Biology,Exam,90,100,4,Spring 2025
2025-03-10,Physics,Project,92,100,3,Spring 2025
2025-03-18,Biology,Project,91,100,3.5,Spring 2025
2025-03-18,Math,Exam,76,100,2.5,Spring 2025
2025-03-18,Physics,Homework,88,100,4,Spring 2025
'


student_data <- read.csv(text = csv_text, stringsAsFactors = FALSE)


student_data$Date <- as.Date(student_data$Date)


usethis::use_data(student_data, overwrite = TRUE)

