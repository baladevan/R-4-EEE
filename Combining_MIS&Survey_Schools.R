## Rajkot EEE- MIS and Survey Schools

# To import MIS data for 2016-17

RajMIS2017 <- read.csv (file = "/Users/BR/Desktop/R 4 EEE/R-4-EEE/DATA/Rajkot Administrative Data/Raj_SSA_MIS_2016-17.csv", header = TRUE, stringsAsFactors = FALSE)

RajMIS2017 <- as.data.frame (RajMIS2017)

# To import survey schools list

EEE_Schools <- read.csv (file = "/Users/BR/Desktop/R 4 EEE/R-4-EEE/DATA/Survey Schools/EEE_Survey_Schools.csv", header = TRUE, stringsAsFactors = FALSE)

# To remove duplicate entries of schools based on school name
EEE_Schools <- EEE_Schools [!duplicated(EEE_Schools$School.Name), ]

EEE_Schools <- as.data.frame (EEE_Schools)

#To collate MIS info of survey schools in one object
EEE_Schools_MIS <- merge (EEE_Schools, RajMIS2017, by.x = "survey_school_name", by.y = "school_name")

dim (EEE_Schools_MIS)
### Not a single school name matched. Manually match schools, edit names in survey schools list and bring it back