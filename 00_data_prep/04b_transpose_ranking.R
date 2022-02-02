###############################################################
# Replaces textual descriptions of likert scales with numbers #
# @Author: Christoph Kraußer                                  #
###############################################################

#### SETUP ####
require(tibble)
require(dplyr)

# Employer expectancies
new_cols <-
  c(
    "Autonomy",
    "Company culture (eg. casual fridays)",
    "Company image",
    "Flexible work arrangements (e.g. flexible working hours, location, etc.)",
    "Good prospects for promotion",
    "High salary",
    "Job security",
    "Meaningfulness of work (eg. making a contribution)",
    "Training opportunities",
    "Work environment (eg. working in a team)",
    "Working on interesting tasks / challeging work",
    "Additional benefits (Insurance, bonus etc.)"
  )

# Different employer expectancies for second run
new_cols2 <-
  c(
    "",
    "Company culture (e.g. casual fridays)",
    "",
    "",
    "",
    "",
    "",
    "Meaningfulness of work (e.g. making a contribution)",
    "",
    "Work environment (e.g. working in a team)",
    "",
    "Additional benefits (e.g. Insurance, bonus etc.)"
  )

df.transposed <- df.revalued

for (col in 1:length(new_cols)) {
  df.transposed <-
    df.transposed %>% add_column(!!(new_cols[col]) := NA, .before = "WE01[1]")
}

s <- which(colnames(df.transposed) == new_cols[1])
e <- which(colnames(df.transposed) == new_cols[length(new_cols)])

df.transposed[, c(s:e)] <- sapply(df.transposed[, c(s:e)], as.numeric)

for (col in 1:length(new_cols)) {
  for (i in 1:nrow(df.transposed)) {
    for (j in 1:5) {
      if (!is.na(df.transposed[i, paste("WE01[", j, "]", sep = "")]) &&
          (df.transposed[i, paste("WE01[", j, "]", sep = "")] == new_cols[col]) |
          (df.transposed[i, paste("WE01[", j, "]", sep = "")] == new_cols2[col])
      ) {
        df.transposed[i, new_cols[col]] = j
      }
    }
  }
}

# Give Columns a more friendly name
names(df.transposed)[names(df.transposed) == 'Autonomy'] <- 'WE01[AUT]'
names(df.transposed)[names(df.transposed) == 'Company culture (eg. casual fridays)'] <- 'WE01[CUL]'
names(df.transposed)[names(df.transposed) == 'Company image'] <- 'WE01[CIM]'
names(df.transposed)[names(df.transposed) == 'Flexible work arrangements (e.g. flexible working hours, location, etc.)'] <- 'WE01[FWA]'
names(df.transposed)[names(df.transposed) == 'Good prospects for promotion'] <- 'WE01[PRO]'
names(df.transposed)[names(df.transposed) == 'High salary'] <- 'WE01[SAL]'
names(df.transposed)[names(df.transposed) == 'Job security'] <- 'WE01[SEC]'
names(df.transposed)[names(df.transposed) == 'Meaningfulness of work (eg. making a contribution)'] <- 'WE01[MFN]'
names(df.transposed)[names(df.transposed) == 'Training opportunities'] <- 'WE01[TRA]'
names(df.transposed)[names(df.transposed) == 'Work environment (eg. working in a team)'] <- 'WE01[ENV]'
names(df.transposed)[names(df.transposed) == 'Working on interesting tasks / challeging work'] <- 'WE01[INT]'
names(df.transposed)[names(df.transposed) == 'Additional benefits (Insurance, bonus etc.)'] <- 'WE01[BEN]'

df.transposed <- select(df.transposed, -c('WE01[1]', 'WE01[2]', 'WE01[3]', 'WE01[4]', 'WE01[5]', 'WE01[6]', 'WE01[7]', 'WE01[8]', 'WE01[9]', 'WE01[10]', 'WE01[11]', 'WE01[12]'))

##### CLEANUP ####
rm(col, e, j, new_cols, new_cols2, s, i)