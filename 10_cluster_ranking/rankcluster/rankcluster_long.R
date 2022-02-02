#######################################
# Rankcluster with several Iterations #
# @Author: Christoph Kraußer          #
#######################################

#### SETUP ####
require(PLMIX)
require(Rankcluster)

mat.ranking.res_long=rankclust(mat.ranking, K=1:5, Qsem=1000, Bsem=100, Ql=500, Bl=50, maxTry=20, run=10)