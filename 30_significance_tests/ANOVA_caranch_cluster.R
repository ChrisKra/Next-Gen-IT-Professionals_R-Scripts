##################################################
# ANOVA Test for Career Anchor based on clusters #
# @Author: Christoph Kraußer                     #
##################################################

s <- which(colnames(mat.ranking.bm_res[["assignment_mapped"]]) == "CAM01") # First column

# Group individual tables by Factor
mapping <- data.frame(c(13, 17, 25), c(10, 11, 20), c(8, 9, 22), c(1, 2, 3), c(15, 19, 24), c(14, 18, NA), c(6, 7, 21), c(4, 5, NA), c(12, 16, 23))
desc <- c("Entrepreneurship", "Technical", "Service", "Managerial", "Lifestyle", "Security-Geographic", "Autonomy", "Security-Job tenure", "Pure challange")

grouped_list <- vector("list", length(desc))
for(i in 1:length(desc)) {
  if (!is.na(mapping[3, i])) {
    grouped_list[[i]] <- data.frame(cluster = mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                    caranch = ((as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[1, i]+s-1])) + 
                                     as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[2, i]+s-1])) + 
                                     as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[3, i]+s-1])))/3))
  } else {
    grouped_list[[i]] <- data.frame(cluster = mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                    caranch = ((as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[1, i]+s-1])) + 
                                     as.numeric(unlist(mat.ranking.bm_res[["assignment_mapped"]][mapping[2, i]+s-1])))/2))
  }
  
  # Export tables as CSV
  #write.table(round(grouped_list[[i]], 4), file = paste("CSV_exports/CarAnch_", i, "-", str_replace_all(desc[i], "/", "_"), ".csv", sep=""), row.names = FALSE, sep=";")
}

for(i in 1:length(desc)) {
  print(desc[i])
  print(summary(aov(caranch ~ cluster, data = grouped_list[[i]])))
}

# Clean up 
rm(s, mapping, desc, i, grouped_list)