#######################################################################
# Displays an overview of the ranking data for explorative analysis   #
# @Author: Christoph Kraußer                                          #
#######################################################################

#### SETUP ####
require(PLMIX)

mat.ranking.0 <- mat.ranking
mat.ranking.0[is.na(mat.ranking.0)] <- 0

rank_summaries <- rank_summaries(mat.ranking.0, format_input = "ranking")

#### CLEANUP ####
rm(mat.ranking.0)

# Density ridges 
# ggplot(melt(mat.ranking, varnames = c("", "item")), aes(x = value, y = item, fill = item)) +
#   geom_density_ridges() +
#   theme_ridges() + 
#   theme(legend.position = "none")