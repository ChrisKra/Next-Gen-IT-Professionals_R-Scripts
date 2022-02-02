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

source("~/BA/scripts/10_cluster_ranking/bayesmallows/create_results_function.R")
mat.ranking.bm_res <- createResults(mat.ranking.bm)

# Print short summary list
cat("SUMMARY:\n")
cat("Cluster proportions:")
print(mat.ranking.bm_res[["assignment_prop"]])
cat("Cluster consensus:")
print.data.frame(head(mat.ranking.bm_res[["consensus"]], 5))


#### CLEANUP ####
rm(clusters, nmc, burn_in)