##############################
# @Author: Christoph Kraußer #
##############################

start <- Sys.time()

# Execute following scripts
source("~/BA/scripts/00_data_prep/01_survey_import.R")
source("~/BA/scripts/00_data_prep/02_combine_surveys.R")
source("~/BA/scripts/00_data_prep/03_clean_data.R")
source("~/BA/scripts/00_data_prep/04_conv_data.R")

end <- Sys.time()
message(paste("Finished in", round(end-start, 4), "seconds"))

#### CLEANUP ####
rm(start, end)
