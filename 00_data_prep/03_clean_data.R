###############################################################
# Cleans the data and removes incomplete or invalid responses #
# @Author: Christoph Kraußer                                  #
###############################################################

#### SETUP ####
require(dplyr)
require(tidyr)

#### 3 FILTER VERSIONS: By lastpage, NA allowlist, NA banlist ####
# Filter by lastpage (7 for survey1 and 8 for survey2)
df.lastpage <- df %>% filter((Survey == 1 & Lastpage == 7) | (Survey == 2 & Lastpage == 8))

## NA Allowlist
NA_allowed <- c('Submitdate', 
                'IN01[other]', 
                'IN02[other]', 
                'WE01[6]',
                'WE01[7]',
                'WE01[8]',
                'WE01[9]',
                'WE01[10]',
                'WE01[11]',
                'WE01[12]',
                'WE02',
                'CS01',
                'DD3[other]')

# NA Banlist
# Get all colnames as csc: dput(names(df))
NA_not_allowed_strict <- c('Survey', 
                    'ID', 
                    'Lastpage', 
                    'Startlanguage', 
                    'Seed', 
                    'Startdate', 
                    'Datestamp', 
                    'IN01', 
                    'IN02', 
                    'IN03', 
                    'IN04', 
                    'SS[SS01]', 
                    'SS[SS02]', 
                    'SS[SS03]', 
                    'TE[TE01]', 
                    'TE[TE02]', 
                    'TE[TE03]', 
                    'TA[TA01]', 
                    'TA[TA02]', 
                    'TA[TA03]', 
                    'TA[TA04]', 
                    'WE01[1]', 
                    'WE01[2]', 
                    'WE01[3]', 
                    'WE01[4]', 
                    'WE01[5]', 
                    'PI[PI01]', 
                    'PI[PI02]', 
                    'PI[PI03]', 
                    'PI[PI04]', 
                    'PI[PI05]', 
                    'PI[PI06]', 
                    'PA[PA1]', 
                    'PA[PA2]', 
                    'PA[PA3]', 
                    'PA[PA4]',  
                    'CarAnch1[CAM01]', 
                    'CarAnch1[CAM02]', 
                    'CarAnch1[CAM03]', 
                    'CarAnch1[CAJ01]', 
                    'CarAnch1[CAJ02]', 
                    'CarAnch1[CAA01]', 
                    'CarAnch1[CAA02]', 
                    'CarAnch2[CAT01]', 
                    'CarAnch2[CAT02]', 
                    'CarAnch2[CAS01]', 
                    'CarAnch2[CAS02]', 
                    'CarAnch2[CAC01]', 
                    'CarAnch2[CAE01]', 
                    'CarAnch2[CAG01]', 
                    'CarAnch2[CAL01]', 
                    'CarAnch3[CAC02]', 
                    'CarAnch3[CAE02]', 
                    'CarAnch3[CAG02]', 
                    'CarAnch3[CAL02]', 
                    'CarAnch3[CAS03]', 
                    'CarAnch3[CAA03]', 
                    'CarAnch3[CAT03]', 
                    'CarAnch3[CAC03]', 
                    'CarAnch3[CAL03]', 
                    'CarAnch3[CAE03]', 
                    'PCBC1[PCS01]', 
                    'PCBC1[PCS02]', 
                    'PCBC1[PCS03]', 
                    'PCBC1[PCS04]', 
                    'PCBC2[PCV01]', 
                    'PCBC2[PCV02]', 
                    'PCBC2[PCV03]', 
                    'PCBC2[PCV04]', 
                    'PCBC3[BCM01]', 
                    'PCBC3[BCM02]', 
                    'PCBC3[BCM03]', 
                    'PCBC3[BCM04]', 
                    'PCBC4[BCP01R]', 
                    'PCBC4[BCP02R]', 
                    'PCBC4[BCP03R]', 
                    'PCBC4[BCP04R]', 
                    'DD1', 
                    'DD2', 
                    'DD3')

NA_not_allowed_future_prospects <- c('IN01', 
                           'IN02', 
                           'IN03', 
                           'WE01[1]', 
                           'WE01[2]', 
                           'WE01[3]', 
                           'WE01[4]', 
                           'WE01[5]', 
                           'PI[PI01]', 
                           'PI[PI02]', 
                           'PI[PI03]', 
                           'PI[PI04]', 
                           'PI[PI05]', 
                           'PI[PI06]', 
                           'PA[PA1]', 
                           'PA[PA2]', 
                           'PA[PA3]', 
                           'PA[PA4]',  
                           'DD1', 
                           'DD2', 
                           'DD3')

NA_not_allowed_car_anch <- c( 
                           'IN01', 
                           'IN02', 
                           'IN03', 
                           'CarAnch1[CAM01]', 
                           'CarAnch1[CAM02]', 
                           'CarAnch1[CAM03]', 
                           'CarAnch1[CAJ01]', 
                           'CarAnch1[CAJ02]', 
                           'CarAnch1[CAA01]', 
                           'CarAnch1[CAA02]', 
                           'CarAnch2[CAT01]', 
                           'CarAnch2[CAT02]', 
                           'CarAnch2[CAS01]', 
                           'CarAnch2[CAS02]', 
                           'CarAnch2[CAC01]', 
                           'CarAnch2[CAE01]', 
                           'CarAnch2[CAG01]', 
                           'CarAnch2[CAL01]', 
                           'CarAnch3[CAC02]', 
                           'CarAnch3[CAE02]', 
                           'CarAnch3[CAG02]', 
                           'CarAnch3[CAL02]', 
                           'CarAnch3[CAS03]', 
                           'CarAnch3[CAA03]', 
                           'CarAnch3[CAT03]', 
                           'CarAnch3[CAC03]', 
                           'CarAnch3[CAL03]', 
                           'CarAnch3[CAE03]', 
                           'DD1', 
                           'DD2', 
                           'DD3')

NA_not_allowed_bless_car_att <- c(
                           'IN01', 
                           'IN02', 
                           'IN03', 
                           'PCBC1[PCS01]', 
                           'PCBC1[PCS02]', 
                           'PCBC1[PCS03]', 
                           'PCBC1[PCS04]', 
                           'PCBC2[PCV01]', 
                           'PCBC2[PCV02]', 
                           'PCBC2[PCV03]', 
                           'PCBC2[PCV04]', 
                           'PCBC3[BCM01]', 
                           'PCBC3[BCM02]', 
                           'PCBC3[BCM03]', 
                           'PCBC3[BCM04]', 
                           'PCBC4[BCP01R]', 
                           'PCBC4[BCP02R]', 
                           'PCBC4[BCP03R]', 
                           'PCBC4[BCP04R]', 
                           'DD1', 
                           'DD2', 
                           'DD3')

NA_not_allowed_pers <- c(
  'DD1', 
  'DD2', 
  'DD3')

NA_not_allowed_employer_exp <- c(
  'WE01[1]', 
  'WE01[2]', 
  'WE01[3]', 
  'WE01[4]', 
  'WE01[5]')

# Filter data by NA in any field (except list)
df.na_allowed <- df %>% drop_na(setdiff(colnames(df),NA_allowed))

# Filter data by NA in any field of list
df.na_not_allowed_strict <- df %>% drop_na(NA_not_allowed_strict)

df.na_not_allowed_future_prospects <- df %>% drop_na(NA_not_allowed_future_prospects)
df.na_not_allowed_car_anch <- df %>% drop_na(NA_not_allowed_car_anch)
df.na_not_allowed_bless_car_att <- df %>% drop_na(NA_not_allowed_bless_car_att)
df.na_not_allowed_pers <- df %>% drop_na(NA_not_allowed_pers)
df.na_not_allowed_employer_exp <- df %>% drop_na(NA_not_allowed_employer_exp)


# Select one cleaned version
df.cleaned <- df.na_not_allowed_employer_exp

##### CLEANUP ####
rm(df.na_not_allowed_pers, df.na_not_allowed_employer_exp, df.lastpage, df.na_allowed, df.na_not_allowed_strict, df.na_not_allowed_future_prospects, df.na_not_allowed_car_anch, df.na_not_allowed_bless_car_att)
rm(NA_not_allowed_pers, NA_allowed, NA_not_allowed_employer_exp, NA_not_allowed_strict, NA_not_allowed_future_prospects, NA_not_allowed_car_anch, NA_not_allowed_bless_car_att)
