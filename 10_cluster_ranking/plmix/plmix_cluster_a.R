require(PLMIX)

for(i in 1:20) {
  assign(paste("MAP", i , sep= "."), mapPLMIX_multistart(pi_inv = mat.ranking.ord, K = 12, G = i, n_start = 20, n_iter = 200*i, centered_start = TRUE, parallel = TRUE) )
}

for (i in 1:20) {
  assign(paste("GIBBS", i , sep = "."),
         gibbsPLMIX(pi_inv=mat.ranking.ord, K=12, G=i,
                    init=list(p=get(paste("MAP", i, sep = ".") )$mod$P_map, z=binary_group_ind(get(paste("MAP", i, sep ="."))$mod$class_map, G=i)), n_iter=2500, n_burn=500) )
}