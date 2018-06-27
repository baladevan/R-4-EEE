## TEMPLATE TO SPLIT MONTHLY EXPENSE DATA 

# For first half of the month, starting variable = "record_id", ending variable = "exp_cmmnt3_apr15". File name format: Month+Exp+1. Ex: AprExp1.
# For second half of the month, startin variable = "record_id", ending variable = "exp_cmmnt3_apr30", drop = "child_age":"exp_cmmnt3_apr15" (customise the end date for each month). File name format: Month+Exp+2. Ex: AprExp2.
# Deduplicate rows in each file and save the resultant file by adding suffix A for the first half of the month and suffix B for the second half of the month. 
# Create a new table for aggregated end notes/ observations and other methodology related variables for all months

# To read the csv file. Naming format: Exp+Month  

Exp_Apr <- read.csv (file = "/Users/BR/Desktop/R 4 EEE/R-4-EEE/DATA/Expense_337/EEE_Exp_Apr_337.csv", header = TRUE, stringsAsFactors = FALSE)


# To create the first half table; should be 981 columns

DecExp1 <- select (Exp_Dec, record_id:exp_cmmnt3_dec15)

# To create the second half table; should be 977 or 1041 columns depending upon on 30/ 31 day month

DecExp2 <- select (Exp_Dec, record_id:exp_cmmnt3_dec30, -(child_age:exp_cmmnt3_dec15))

# To remove duplicates based on diary_num (Code below to store unique rows of AprExp1 in AprExp1A, and unique rows of AprExp2 in AprExp2A) 

DecExp1A <- DecExp1 [!duplicated(DecExp1$diary_num), ]
DecExp2A <- DecExp2 [!duplicated(DecExp2$diary_num), ]

# To deduplicate by a combination of 2 variables
Dedup_DecExp <- Exp_Dec [!duplicated (Exp_Dec [c(Exp_Dec$diary_num, Exp_Dec$child_uid)]),]

# To save the output as Rdata files (manually shifting the files to the Deduplicated Expense Data folder; have to write code)

save (DecExp1A,file="DecExp1A.Rdata")
save (DecExp2A,file="DecExp2A.Rdata")
.....

# To check dimensions - rows in the 2 files should be same, colums in first half will be 981 and 977 or 1041 for second half 

dim (Exp_May)
dim (MayExp1A)
dim (MayExp2A)

# To keep the workspace tidy, remove the halved files with duplicates. The main file for the month and the two halves are enough)

remove (MayExp1, MayExp2)
 


