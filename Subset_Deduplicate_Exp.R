## TEMPLATE TO SPLIT MONTHLY EXPENSE DATA 

# For first half of the month, starting variable = "record_id", ending variable = "exp_cmmnt3_apr15". File name format: Month+Exp+1. Ex: AprExp1.
# For second half of the month, startin variable = "record_id", ending variable = "exp_cmmnt3_apr30", drop = "child_age":"exp_cmmnt3_apr15" (customise the end date for each month). File name format: Month+Exp+2. Ex: AprExp2.
# Deduplicate rows in each file and save the resultant file by adding suffix A for the first half of the month and suffix B for the second half of the month. 
# Create a new table for aggregated end notes/ observations and other methodology related variables for all months

# To read the csv file. Naming format: Exp+Month  

Exp_Nov <- read.csv (file = "/Users/BR/Desktop/R 4 EEE/R-4-EEE/DATA/Expense_44DiaryData/Cleaned_Expense_Nov.csv", header = TRUE, stringsAsFactors = FALSE)


# To create the first half table

NovExp1 <- select (Exp_Nov, record_id:exp_cmmnt3_nov15)

# To create the second half table

NovExp2 <- select (Exp_Nov, record_id:exp_cmmnt3_nov30, -(child_age:exp_cmmnt3_nov15))

# To remove duplicates based on diary_num (Code below to store unique rows of AprExp1 in AprExp1A, and unique rows of AprExp2 in AprExp2A) 

NovExp1A <- NovExp1 [!duplicated(NovExp1$diary_num), ]
NovExp2A <- NovExp2 [!duplicated(NovExp2$diary_num), ]
