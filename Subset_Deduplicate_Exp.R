## TEMPLATE TO SPLIT MONTHLY EXPENSE DATA 

# For first half of the month, starting variable = "record_id", ending variable = "exp_cmmnt3_apr15". File name format: Month+Exp+1. Ex: AprExp1.
# For second half of the month, startin variable = "record_id", ending variable = "exp_cmmnt3_apr30", drop = "child_age":"exp_cmmnt3_apr15" (customise the end date for each month). File name format: Month+Exp+2. Ex: AprExp2.
# Deduplicate rows in each file and save the resultant file by adding suffix A for the first half of the month and suffix B for the second half of the month. 
# Create a new table for aggregated end notes/ observations and other methodology related variables for all months

# To create the first half table

AprExp1 <- select (Exp_Apr, record_id:exp_cmmnt3_apr15)

# To create the second half table

AprExp2 <- select (Exp_Apr, record_id:exp_cmmnt3_apr30, -(child_age:exp_cmmnt3_apr15))

# Ro remove duplicates based on diary_num (Code below to store unique rows of AprExp1 in AprExp1A, and unique rows of AprExp2 in AprExp2A) 

AprExp1A <- AprExp1 [!duplicated(AprExp1$diary_num), ]
AprExp2A <- AprExp2 [!duplicated(AprExp2$diary_num), ]
