require("factoextra")
require("clustertend")

CarAnch <- df.transposed[, which(colnames(df.transposed)=="CarAnch1[CAM01]"):which(colnames(df.transposed)=="CarAnch3[CAE03]")]

for (i in 1:length(CarAnch)) {
  CarAnch[, i] <- as.numeric(CarAnch[, i])
}

rm(i)