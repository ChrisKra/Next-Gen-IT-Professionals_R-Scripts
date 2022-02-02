##############################
# @Author: Christoph Kraußer #
##############################

start <- Sys.time()

rmarkdown::render("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster_long.Rmd", 
                  output_file = paste("bm_cluster_long", format(Sys.time(), "%Y_%m_%d-%H_%M"), sep = "-"), 
                  output_dir = "~/BA/scripts/10_cluster_ranking/bayesmallows/html"
                  )
# 
# rmarkdown::render("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster_long4.Rmd", 
#                   output_file = paste("bm_cluster_long", format(Sys.time(), "%Y_%m_%d-%H_%M"), sep = "-"), 
#                   output_dir = "~/BA/scripts/10_cluster_ranking/bayesmallows/html"
# )
# 
# rmarkdown::render("~/BA/scripts/10_cluster_ranking/bayesmallows/bayesmallows_cluster_long5.Rmd", 
#                   output_file = paste("bm_cluster_long", format(Sys.time(), "%Y_%m_%d-%H_%M"), sep = "-"), 
#                   output_dir = "~/BA/scripts/10_cluster_ranking/bayesmallows/html"
# )

end <- Sys.time()
message(paste("Finished in", round(difftime(end, start, units = "secs"), 4), "seconds"))

#### CLEANUP ####
rm(start, end)
