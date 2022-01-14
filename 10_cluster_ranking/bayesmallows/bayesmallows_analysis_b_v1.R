#########################################################
# Re-run MCMC with burn-in and more Monte Carlo samples #
# @Author: Christoph Kraußer                            #
#########################################################

## Not run:
'
# To assess burnin and nmc
## Trace plot for α
assess_convergence(mat.ranking.bm_test)

## Trace plot for ρ:
assess_convergence(mat.ranking.bm_test, parameter = "rho", items = 1:5)
'
## End(Not run)

#### SETUP ####
require(BayesMallows)

#### PARAMETERS ####
burn_in <- 1000
nmc <- 500000

mat.ranking.bm_visual <- compute_mallows(mat.ranking, nmc = (nmc+burn_in), verbose = TRUE)
mat.ranking.bm_visual$burnin <- burn_in # Set burn-in

#### CLEANUP ####
rm(burn_in, nmc)