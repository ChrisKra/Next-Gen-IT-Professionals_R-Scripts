require(PLMIX)
require(Rankcluster)

resLong=rankclust(ranking, K=1:5, Qsem=1000, Bsem=100, Ql=500, Bl=50, maxTry=20, run=10)