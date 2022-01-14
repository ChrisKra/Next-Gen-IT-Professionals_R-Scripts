########################################################
# Final analysis of posterior distribution & intervals #
# @Author: Christoph Kraußer                           #
########################################################

## Not run:
'
# Assess posterior distributions & intervals
## Posterior distribution of α
plot(mat.ranking.bm_visual)

## Posterior credible intervals for α
compute_posterior_intervals(mat.ranking.bm_visual, decimals = 1L)

## Posterior distribution of ρ
plot(mat.ranking.bm_visual, parameter = "rho", items = 1:12)
'
## End(Not run)