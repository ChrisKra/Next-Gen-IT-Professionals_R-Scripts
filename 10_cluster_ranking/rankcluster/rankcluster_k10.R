#####################################
# Rankcluster with 1 to 10 Clusters #
# @Author: Christoph Kraußer        #
#####################################

#### SETUP ####
require(PLMIX)
require(Rankcluster)

mat.ranking.res_k10=rankclust(mat.ranking, K=1:10)