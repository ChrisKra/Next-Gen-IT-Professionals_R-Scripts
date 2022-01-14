require(BayesMallows)

jpeg(file="tp_alpha.jpeg")


assess_convergence(bmm)

# assess_convergence(bmm, parameter = "rho", items = 1:5)


dev.off()
