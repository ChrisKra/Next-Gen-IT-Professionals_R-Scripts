##############################
# @Author: Christoph Kraußer #
##############################

start <- Sys.time()

# Execute following scripts
source("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_analysis_a_v1.R")
source("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_analysis_b_v1.R")
source("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_analysis_c_v1.R")

rmarkdown::render("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_analysis.Rmd")

end <- Sys.time()
message(paste("Finished in", round(difftime(end, start, units = "secs"), 4), "seconds"))

#### CLEANUP ####
rm(start, end)
