require(plyr)

mu <- mat.ranking.res@results[[5]]@mu

num2crit <- c(
  '1'= 'Autonomy',
  '2'= 'Comp. culture',
  '3'= 'Comp. image',
  '4'= 'Flexible work',
  '5'= 'Promotion',
  '6'= 'Salary',
  '7'= 'Job security',
  '8'= 'Meaningfulness of work',
  '9'= 'Training opp.',
  '10'= 'Work env.',
  '11'= 'Interesting tasks',
  '12'= 'Add. benefits'
)

mu <- convertRank(mu)

for (i in 1:nrow(mu)) {
  mu[i,] <- revalue(as.character(mu[i,]), num2crit)
}

mu <- t(mu)

rm(num2crit, i)