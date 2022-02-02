#################################################################
# This script imports mapping table and both survey runs into R #
# @Author: Christoph Kraußer                                    #
#################################################################

#### SETUP ####
library(readr, lib.loc = "/home/rstudio/R/x86_64-pc-linux-gnu-library/4.1")
library(readxl)

# Import mapping table
mapping_table <- read_csv("import/Export_mapping_table.csv", 
                          col_types = cols(FieldId1 = col_integer(), 
                                           FieldId2 = col_integer()))

# Import surveys
survey_run_1 <- read_excel("import/Export_Umfrage Durchlauf 1.xlsx", 
                           col_types = c("numeric", "numeric", "text", 
                                         "numeric", "text", "numeric", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text", "text", "text", "text", "text", 
                                         "text"))

survey_run_2 <- read_excel("import/Export_Umfrage Durchlauf 2.xlsx")