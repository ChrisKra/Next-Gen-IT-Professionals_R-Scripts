###########################################################
# Converts dataframe into a matrixes for cluster analysis #
# @Author: Christoph Kraußer                              #
###########################################################

# Convert employer expectancies ranking
mat.ranking <- data.matrix(df.transposed[, which(colnames(df.transposed) == 'WE01[AUT]'):which(colnames(df.transposed) == 'WE01[BEN]')])

# Convert career anchors
# mat.caranch <- data.matrix(df.transposed[, which(colnames(df.transposed) == 'CarAnch1[CAM01]'):which(colnames(df.transposed) == 'CarAnch3[CAE03]')])


#### CLEANUP ####