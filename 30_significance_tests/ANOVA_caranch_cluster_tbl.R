##################################################
# ANOVA Test for Career Anchor based on clusters #
# @Author: Christoph Kraußer                     #
##################################################

require(gtsummary)
require(dplyr)

s <- which(colnames(mat.ranking.bm_res[["assignment_mapped"]]) == "CAM01") # First column

# Group individual tables by Factor
mapping <- data.frame(c(13, 17, 25), c(10, 11, 20), c(8, 9, 22), c(1, 2, 3), c(15, 19, 24), c(14, 18, NA), c(6, 7, 21), c(4, 5, NA), c(12, 16, 23))
desc <- c("Entrepreneurship", "Technical", "Service", "Managerial", "Lifestyle", "Security-Geographic", "Autonomy", "Security-Job tenure", "Pure challange")

carAnch <- data.frame(cluster = mat.ranking.bm_res[["assignment_mapped"]]$cluster)

for(i in 1:length(desc)) {
  if (!is.na(mapping[3, i])) {
    carAnch[desc[i]] <- ((as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[1, i]+s-1])) + 
                                                  as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[2, i]+s-1])) + 
                                                  as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[3, i]+s-1])))/3)
  } else {
    carAnch[desc[i]] <- ((as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[1, i]+s-1])) + 
                            as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[2, i]+s-1])))/2)
  }
}

tbl_carAnch <- carAnch %>% 
  tbl_summary(by=cluster, 
              type = list("Security-Geographic" ~ "continuous", 
                          "Security-Job tenure" ~ "continuous"),
              missing = "no"
              ) %>% 
  add_p(test = list(all_continuous() ~ "aov")) %>% 
  modify_spanning_header(all_stat_cols() ~ "**Cluster**") %>% 
  modify_header(label = "**Career anchor**")

# Clean up 
rm(s, mapping, desc, i, carAnch)