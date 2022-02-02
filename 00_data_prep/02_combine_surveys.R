#################################################################
# This script imports mapping table and both survey runs into R #
# @Author: Christoph Kraußer                                    #
#################################################################

#### SETUP ####
library(dplyr, lib.loc = "/home/rstudio/R/x86_64-pc-linux-gnu-library/4.1")
library(tibble, lib.loc = "/home/rstudio/R/x86_64-pc-linux-gnu-library/4.1")

# Create first column and survey dataframe
Survey <- c(rep(1, nrow(survey_run_1)), rep(2, nrow(survey_run_2)))
df <- data.frame(Survey)

# Append and fill additional columns using colname from mapping table and combine colRun1 + colRun2 
for (row in 1:length(mapping_table$FieldCode)) {
  df <- df %>% add_column(!!(mapping_table$FieldCode[row]) := c(pull(survey_run_1, mapping_table$FieldId1[row]), pull(survey_run_2, mapping_table$FieldId2[row])))
}

##### CLEANUP ####
rm(Survey, row, survey_run_1, survey_run_2, mapping_table)
