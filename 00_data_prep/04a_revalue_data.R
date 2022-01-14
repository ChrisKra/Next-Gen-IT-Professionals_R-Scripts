###############################################################
# Replaces textual descriptions of likert scales with numbers #
# @Author: Christoph Kraußer                                  #
###############################################################

#### SETUP ####
require(plyr)

# Mapping of likert scales
likert7ag <- c(
  'Strongly disagree'= '-3',
  'Strongly Disagree'= '-3',
  'Disagree'= '-2',
  'Slightly disagree'= '-1',
  'Slightly Disagree'= '-1',
  'Undecided'= '0',
  'Slightly agree'= '1',
  'Slightly Agree'= '1',
  'Agree'= '2',
  'Strongly agree'= '3',
  'Strongly Agree'= '3'
)

likert5im <- c(
  'Not important'= '0',
  'Slightly important'= '1',
  'Moderately important'= '2',
  'Very important'= '3',
  'Centrally important'= '4'
)

likert5tr <- c(
  'Not at all true'= '-2',
  'Slightly untrue'= '-1',
  'Neither untrue nor true'= '0',
  'Slightly true'= '1',
  'Completely true'= '2'
)

# Likert scale belonging to each field
scale <- list(
  'SS[SS01]' = likert7ag,
  'SS[SS02]' = likert7ag,
  'SS[SS03]' = likert7ag,
  'TE[TE01]' = likert7ag,
  'TE[TE02]' = likert7ag,
  'TE[TE03]' = likert7ag,
  'TA[TA01]' = likert7ag,
  'TA[TA02]' = likert7ag,
  'TA[TA03]' = likert7ag,
  'TA[TA04]' = likert7ag,
  'PI[PI01]' = likert7ag,
  'PI[PI02]' = likert7ag,
  'PI[PI03]' = likert7ag,
  'PI[PI04]' = likert7ag,
  'PI[PI05]' = likert7ag,
  'PI[PI06]' = likert7ag,
  'PA[PA1]' = likert7ag,
  'PA[PA2]' = likert7ag,
  'PA[PA3]' = likert7ag,
  'PA[PA4]' = likert7ag,
  'CarAnch1[CAM01]' = likert5im,
  'CarAnch1[CAM02]' = likert5im,
  'CarAnch1[CAM03]' = likert5im,
  'CarAnch1[CAJ01]' = likert5im,
  'CarAnch1[CAJ02]' = likert5im,
  'CarAnch1[CAA01]' = likert5im,
  'CarAnch1[CAA02]' = likert5im,
  'CarAnch2[CAT01]' = likert5im,
  'CarAnch2[CAT02]' = likert5im,
  'CarAnch2[CAS01]' = likert5im,
  'CarAnch2[CAS02]' = likert5im,
  'CarAnch2[CAC01]' = likert5im,
  'CarAnch2[CAE01]' = likert5im,
  'CarAnch2[CAG01]' = likert5im,
  'CarAnch2[CAL01]' = likert5im,
  'CarAnch3[CAC02]' = likert5tr,
  'CarAnch3[CAE02]' = likert5tr,
  'CarAnch3[CAG02]' = likert5tr,
  'CarAnch3[CAL02]' = likert5tr,
  'CarAnch3[CAS03]' = likert5tr,
  'CarAnch3[CAA03]' = likert5tr,
  'CarAnch3[CAT03]' = likert5tr,
  'CarAnch3[CAC03]' = likert5tr,
  'CarAnch3[CAL03]' = likert5tr,
  'CarAnch3[CAE03]' = likert5tr,
  'PCBC1[PCS01]' = likert7ag,
  'PCBC1[PCS02]' = likert7ag,
  'PCBC1[PCS03]' = likert7ag,
  'PCBC1[PCS04]' = likert7ag,
  'PCBC2[PCV01]' = likert7ag,
  'PCBC2[PCV02]' = likert7ag,
  'PCBC2[PCV03]' = likert7ag,
  'PCBC2[PCV04]' = likert7ag,
  'PCBC3[BCM01]' = likert7ag,
  'PCBC3[BCM02]' = likert7ag,
  'PCBC3[BCM03]' = likert7ag,
  'PCBC3[BCM04]' = likert7ag,
  'PCBC4[BCP01R]' = likert7ag,
  'PCBC4[BCP02R]' = likert7ag,
  'PCBC4[BCP03R]' = likert7ag,
  'PCBC4[BCP04R]' = likert7ag
)

# Copy cleaned df into revalued df
df.revalued <- df.cleaned

# Revalue columns  
for (i in 1:length(names(scale))) {
  df.revalued[,names(scale)[i]] <- revalue(df.revalued[,names(scale)[i]], scale[[i]])
}

##### CLEANUP ####
rm(i, likert7ag, likert5im, likert5tr, scale)