createResults <- function(mat.ranking.bm) {
  abbr2crit <- function(x) {
    x[x == "WE01[AUT]"] <- "Autonomy"
    x[x == "WE01[CUL]"] <- "Company culture"
    x[x == "WE01[CIM]"] <- "Company image"
    x[x == "WE01[FWA]"] <- "Flexible work arrangements"
    x[x == "WE01[PRO]"] <- "Prospects for Promotion"
    x[x == "WE01[SAL]"] <- "High Salary"
    x[x == "WE01[SEC]"] <- "Job security"
    x[x == "WE01[MFN]"] <- "Meaningfulness of work"
    x[x == "WE01[TRA]"] <- "Training opportunities"
    x[x == "WE01[ENV]"] <- "Work environment"
    x[x == "WE01[INT]"] <- "Interesting tasks"
    x[x == "WE01[BEN]"] <- "Additional benefits"
    
    return(x)
  }
  
  # Build results summary list
  mat.ranking.bm_res <- list("assignments" = assign_cluster(mat.ranking.bm))
  
  suppressWarnings({ mat.ranking.bm_res <- append(mat.ranking.bm_res, list(
    "assignments_simple" = (mat.ranking.bm_res[["assignments"]] %>% 
                              filter_("cluster==map_cluster") %>%  
                              select(-map_cluster)))) })
  
  mat.ranking.bm_res <- append(mat.ranking.bm_res, list(
    "assignment_mapped" = mat.ranking.bm_res[["assignments_simple"]]))
  
  # Demographics
  mat.ranking.bm_res[["assignment_mapped"]]$degree <- df.transposed[, "IN01"]
  mat.ranking.bm_res[["assignment_mapped"]]$course <- df.transposed[, "IN02"]
  mat.ranking.bm_res[["assignment_mapped"]]$semester <- df.transposed[, "IN03"]
  mat.ranking.bm_res[["assignment_mapped"]]$work <- df.transposed[, "IN04"]
  mat.ranking.bm_res[["assignment_mapped"]]$age <- df.transposed[, "DD1"]
  mat.ranking.bm_res[["assignment_mapped"]]$gender <- df.transposed[, "DD2"]
  mat.ranking.bm_res[["assignment_mapped"]]$university <- df.transposed[, "DD3"]
  
  # Career anchor
  mat.ranking.bm_res[["assignment_mapped"]]$CAM01 <- df.transposed[, "CarAnch1[CAM01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAM02 <- df.transposed[, "CarAnch1[CAM02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAM03 <- df.transposed[, "CarAnch1[CAM03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAJ01 <- df.transposed[, "CarAnch1[CAJ01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAJ02 <- df.transposed[, "CarAnch1[CAJ02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAA01 <- df.transposed[, "CarAnch1[CAA01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAA02 <- df.transposed[, "CarAnch1[CAA02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAT01 <- df.transposed[, "CarAnch2[CAT01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAT02 <- df.transposed[, "CarAnch2[CAT02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAS01 <- df.transposed[, "CarAnch2[CAS01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAS02 <- df.transposed[, "CarAnch2[CAS02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAC01 <- df.transposed[, "CarAnch2[CAC01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAE01 <- df.transposed[, "CarAnch2[CAE01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAG01 <- df.transposed[, "CarAnch2[CAG01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAL01 <- df.transposed[, "CarAnch2[CAL01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAC02 <- df.transposed[, "CarAnch3[CAC02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAE02 <- df.transposed[, "CarAnch3[CAE02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAG02 <- df.transposed[, "CarAnch3[CAG02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAL02 <- df.transposed[, "CarAnch3[CAL02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAS03 <- df.transposed[, "CarAnch3[CAS03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAA03 <- df.transposed[, "CarAnch3[CAA03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAT03 <- df.transposed[, "CarAnch3[CAT03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAC03 <- df.transposed[, "CarAnch3[CAC03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAL03 <- df.transposed[, "CarAnch3[CAL03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$CAE03 <- df.transposed[, "CarAnch3[CAE03]"]
  
  # Boundaryless career attitudes
  mat.ranking.bm_res[["assignment_mapped"]]$PCS01 <- df.transposed[, "PCBC1[PCS01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCS02 <- df.transposed[, "PCBC1[PCS02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCS03 <- df.transposed[, "PCBC1[PCS03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCS04 <- df.transposed[, "PCBC1[PCS04]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCV01 <- df.transposed[, "PCBC2[PCV01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCV02 <- df.transposed[, "PCBC2[PCV02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCV03 <- df.transposed[, "PCBC2[PCV03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PCV04 <- df.transposed[, "PCBC2[PCV04]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCM01 <- df.transposed[, "PCBC3[BCM01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCM02 <- df.transposed[, "PCBC3[BCM02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCM03 <- df.transposed[, "PCBC3[BCM03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCM04 <- df.transposed[, "PCBC3[BCM04]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCP01R <- df.transposed[, "PCBC4[BCP01R]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCP02R <- df.transposed[, "PCBC4[BCP02R]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCP03R <- df.transposed[, "PCBC4[BCP03R]"]
  mat.ranking.bm_res[["assignment_mapped"]]$BCP04R <- df.transposed[, "PCBC4[BCP04R]"]
  
  # Professional Identification & Percieved Job Alternatives
  mat.ranking.bm_res[["assignment_mapped"]]$PI01 <- df.transposed[, "PI[PI01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PI02 <- df.transposed[, "PI[PI02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PI03 <- df.transposed[, "PI[PI03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PI04 <- df.transposed[, "PI[PI04]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PI05 <- df.transposed[, "PI[PI05]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PI06 <- df.transposed[, "PI[PI06]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PA1 <- df.transposed[, "PA[PA1]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PA2 <- df.transposed[, "PA[PA2]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PA3 <- df.transposed[, "PA[PA3]"]
  mat.ranking.bm_res[["assignment_mapped"]]$PA4 <- df.transposed[, "PA[PA4]"]
  
  # Academic Satisfaction, Technical Efficacy, Turnaway Intentions
  mat.ranking.bm_res[["assignment_mapped"]]$SS01 <- df.transposed[, "SS[SS01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$SS02 <- df.transposed[, "SS[SS02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$SS03 <- df.transposed[, "SS[SS03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TE01 <- df.transposed[, "TE[TE01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TE02 <- df.transposed[, "TE[TE02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TE03 <- df.transposed[, "TE[TE03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TA01 <- df.transposed[, "TA[TA01]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TA02 <- df.transposed[, "TA[TA02]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TA03 <- df.transposed[, "TA[TA03]"]
  mat.ranking.bm_res[["assignment_mapped"]]$TA04 <- df.transposed[, "TA[TA04]"]
  
  setClass("assignment_demographic",representation=representation(
    degree.abs = "data.frame",
    degree.rel = "data.frame",
    course.abs = "data.frame",
    course.rel = "data.frame",
    semester.abs = "data.frame",
    semester.rel = "data.frame",
    work.abs = "data.frame",
    work.rel = "data.frame",
    age.abs = "data.frame",
    age.rel = "data.frame",
    gender.abs = "data.frame",
    gender.rel = "data.frame",
    university.abs = "data.frame",
    university.rel = "data.frame"
  ))
  
  mat.ranking.bm_res <- append(mat.ranking.bm_res, 
                               list("assignment_dem" = new("assignment_demographic",
                                                           degree.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$degree, 
                                                             useNA = "ifany"))),
                                                           degree.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$degree), 
                                                             1))),
                                                           course.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$course, 
                                                             useNA = "ifany"))),
                                                           course.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$course), 
                                                             1))),
                                                           semester.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$semester, 
                                                             useNA = "ifany"))),
                                                           semester.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$semester), 
                                                             1))),
                                                           work.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$work, 
                                                             useNA = "ifany"))),
                                                           work.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$work), 
                                                             1))),
                                                           age.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$age, 
                                                             useNA = "ifany"))),
                                                           age.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$age), 
                                                             1))),
                                                           gender.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$gender, 
                                                             useNA = "ifany"))),
                                                           gender.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$gender), 
                                                             1))),
                                                           university.abs = as.data.frame.matrix(t(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$university, 
                                                             useNA = "ifany"))),
                                                           university.rel = as.data.frame.matrix(t(prop.table(table(
                                                             mat.ranking.bm_res[["assignment_mapped"]]$cluster, 
                                                             mat.ranking.bm_res[["assignment_mapped"]]$university), 
                                                             1)))
                               )))
  
  mat.ranking.bm_res <- append(mat.ranking.bm_res, list(
    "assignment_num" = table(mat.ranking.bm_res[["assignments_simple"]]$cluster)))
  
  mat.ranking.bm_res <- append(mat.ranking.bm_res, list(
    "assignment_prop" = prop.table(table(mat.ranking.bm_res[["assignments_simple"]]$cluster))))
  
  mat.ranking.bm_res <- append(mat.ranking.bm_res, list(
    "assignment_probSum" = (mat.ranking.bm_res[["assignments_simple"]] %>% 
                              group_by(cluster) %>% 
                              summarize(mean = mean(probability), 
                                        median = median(probability)))))
  
  mat.ranking.bm_res <- append(mat.ranking.bm_res, list(
    "consensus" = (compute_consensus(mat.ranking.bm) %>%
                     select(-cumprob) %>%
                     spread(key = cluster, value = item) %>%
                     select(-ranking) %>%
                     abbr2crit())))
  
  return(mat.ranking.bm_res)
}