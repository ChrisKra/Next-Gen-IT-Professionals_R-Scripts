##############################
# @Author: Christoph Kraußer #
##############################

start <- Sys.time()


rmarkdown::render("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster.Rmd", 
                  output_file = paste("bm_cluster", format(Sys.time(), "%Y_%m_%d-%H_%M"), sep = "-"), 
                  output_dir = "~/BA/scripts/10_cluster_ranking/bayesmallows/html"
)


end <- Sys.time()
message(paste("Finished in", round(difftime(end, start, units = "secs"), 4), "seconds"))

#### CLEANUP ####
rm(start, end)
