####################################
# Rankcluster with 1 to 5 Clusters #
# @Author: Christoph Kraußer       #
####################################

#### SETUP ####
require(PLMIX)
require(Rankcluster)

mat.ranking.res=rankclust(mat.ranking, K=1:5)