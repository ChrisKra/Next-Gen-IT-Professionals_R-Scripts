########################################################
# Test run to assess convergence of the MCMC algorithm #
# @Author: Christoph Kraußer                           #
########################################################

#### SETUP ####
require(BayesMallows)
require(parallel)

#### PARAMETERS ####
cores <- 2 # Number of cpu cores for parallel execution
clusters <- c(1, 3, 5, 10) # Clusters for test run
nmc <- 5000 # Monte Carlo samples

cl <- makeCluster(cores)

mat.ranking.bm_test <- compute_mallows_mixtures(n_clusters = clusters,
                                rankings = mat.ranking, 
                                nmc = nmc,
                                save_clus = FALSE, 
                                include_wcd = FALSE, 
                                cl = cl
)

stopCluster(cl)

#### CLEANUP ####
rm(cores, clusters, nmc, cl)