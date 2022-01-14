require("BayesMallows")

bmm4 <- compute_mallows(
  rankings = ranking, 
  n_clusters = 4, 
  nmc = 200000, 
  leap_size = 1, 
  metric = "footrule", 
  rho_thinning = 10, 
  alpha_prop_sd = 0.1, 
  alpha_jump = 15, 
  lambda = 0.1,
  psi = 10, 
  save_aug = FALSE , 
  save_clus = TRUE ,
  clus_thin = 10, 
  include_wcd = FALSE, 
  verbose = TRUE, 
  save_ind_clus = FALSE , 
  logz_estimate = NULL)