##############################
# @Author: Christoph Kraußer #
##############################

start <- Sys.time()

# Execute following scripts
source("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster_a_v1.R")
source("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster_b_v1.R")
source("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster_c_v1.R")

rmarkdown::render("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster.Rmd")

end <- Sys.time()
message(paste("Finished in", round(difftime(end, start, units = "secs"), 4), "seconds"))

#### CLEANUP ####
rm(start, end)
