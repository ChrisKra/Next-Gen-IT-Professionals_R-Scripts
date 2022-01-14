########################################################
# Convergence diagnostics & decision on cluster count  #
# @Author: Christoph Kraußer                           #
########################################################

## Not run:
'
# Convergence diagnostics
## Trace plot for α
assess_convergence(mat.ranking.bm_test)

## Trace plot for τc:
assess_convergence(mat.ranking.bm_test, parameter = "cluster_probs")
'
## End(Not run)

#### SETUP ####
require(BayesMallows)
require(parallel)

#### PARAMETERS ####
cores <- 2 # Number of cpu cores for parallel execution
clusters <- 10 # Number of clusters 
burn_in <- 5000 # Burn-in
nmc <- 95000 # Monte Carlo samples


cl <- makeCluster(cores)

mat.ranking.bmm <- compute_mallows_mixtures(n_clusters = 1:clusters, 
                                rankings = mat.ranking,
                                nmc = (burn_in+nmc), 
                                rho_thinning = 10,
                                save_clus = FALSE,
                                include_wcd = TRUE, 
                                verbose = TRUE,
                                cl = cl
)

stopCluster(cl)

#### CLEANUP ####
rm(cores, clusters, nmc, burn_in, cl)