##################################################
# Final clustering, results plotting and saving  #
# @Author: Christoph Kraußer                     #
##################################################

## Not run:
'
## Plot elbow
plot_elbow(mat.ranking.bmm, burnin = 5000) # Create elbow plot
'
## End(Not run)

#### SETUP ####
require(BayesMallows)
require(tidyr)
require(dplyr)

#### PARAMETERS ####
clusters <- 3 # Number of final clusters 
burn_in <- 5000 # Burn-in
nmc <- 95000 # Monte Carlo samples e.g. 95000

mat.ranking.bm <- compute_mallows(rankings = mat.ranking, 
                          n_clusters = clusters, 
                          save_clus = TRUE,
                          clus_thin = 10, 
                          nmc = (burn_in+nmc), 
                          rho_thinning = 10, 
                          verbose = TRUE
)

mat.ranking.bm$burnin <- burn_in # Set bun-in

## Not run:
'
## Plot the posterior distributions of α and ρ
assess_convergence(mat.ranking.bm)
assess_convergence(mat.ranking.bm, parameter = "rho", items = 1:5)

## Posterior distributions of the cluster probabilities
plot(mat.ranking.bm, parameter = "cluster_probs")

## Visualize posterior probability for each assessor to belong to a certain cluster
plot(mat.ranking.bm, parameter = "cluster_assignment")
'
## End(Not run)

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
mat.ranking.bm_res[["assignment_mapped"]]$degree <- df.transposed[, "IN01"]
mat.ranking.bm_res[["assignment_mapped"]]$course <- df.transposed[, "IN02"]
mat.ranking.bm_res[["assignment_mapped"]]$semester <- df.transposed[, "IN03"]
mat.ranking.bm_res[["assignment_mapped"]]$work <- df.transposed[, "IN04"]
mat.ranking.bm_res[["assignment_mapped"]]$age <- df.transposed[, "DD1"]
mat.ranking.bm_res[["assignment_mapped"]]$gender <- df.transposed[, "DD2"]
mat.ranking.bm_res[["assignment_mapped"]]$university <- df.transposed[, "DD3"]

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

# Print short summary list
cat("SUMMARY:\n")
cat("Cluster proportions:")
print(mat.ranking.bm_res[["assignment_prop"]])
cat("Cluster consensus:")
print.data.frame(head(mat.ranking.bm_res[["consensus"]], 5))


#### CLEANUP ####
rm(clusters, nmc, burn_in, abbr2crit)