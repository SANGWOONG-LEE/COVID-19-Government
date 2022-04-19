#### Preamble ####
# Purpose: Prepare the 2021 US GSS data
# Author: SangWoong Lee
# Data: 18 April 2022
# Contact: sangwoong.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the 2018 and 2021 GSS data and saved it to inputs/data


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(dplyr)
# Read in the raw data. 
raw_data1 <- haven::read_dta("inputs/data/2021_stata/GSS2018.dta")
raw_data2 <- haven::read_dta("inputs/data/2021_stata/gss2021.dta")


# Just keep some variables that may be of interest (change 
# this depending on your interests)
names(raw_data1)
names(raw_data2)

reduced_data1 <- 
  raw_data1 %>% 
  select(nataid,
         natarms, 
         natchld,
         natcity,
         natcrime,
         natdrug,
         nateduc,
         natenrgy,
         natenvir,
         natfare,
         natheal,
         natmass,
         natpark,
         natrace,
         natroad,
         natsci,
         natsoc,
         eqwlth,
         ) %>%
  rename(nataid2018 = nataid,
         natarms2018 = natarms,
         natchld2018 = natchld,
         natcity2018 = natcity,
         natcrime2018 = natcrime,
         natdrug2018 = natdrug,
         nateduc2018 = nateduc,
         natenrgy2018 = natenrgy,
         natenvir2018 = natenvir,
         natfare2018 = natfare,
         natheal2018 = natheal,
         natmass2018 = natmass,
         natpark2018 = natpark,
         natrace2018 = natrace,
         natroad2018 = natroad,
         natsci2018 = natsci,
         natsoc2018 = natsoc,
         eqwlth2018 = eqwlth
  )
reduced_data2 <-
  raw_data2 %>% 
  select(nataid,
         natarms, 
         natchld,
         natcity,
         natcrime,
         natdrug,
         nateduc,
         natenrgy,
         natenvir,
         natfare,
         natheal,
         natmass,
         natpark,
         natrace,
         natroad,
         natsci,
         natsoc,
         eqwlth,
  )%>%
  rename(nataid2021 = nataid,
         natarms2021 = natarms,
         natchld2021 = natchld,
         natcity2021 = natcity,
         natcrime2021 = natcrime,
         natdrug2021 = natdrug,
         nateduc2021 = nateduc,
         natenrgy2021 = natenrgy,
         natenvir2021 = natenvir,
         natfare2021 = natfare,
         natheal2021 = natheal,
         natmass2021 = natmass,
         natpark2021 = natpark,
         natrace2021 = natrace,
         natroad2021 = natroad,
         natsci2021 = natsci,
         natsoc2021 = natsoc,
         eqwlth2021 = eqwlth
  )

#### Save ####
write_csv(reduced_data1, "outputs/data/prepared_gss1.csv")
write_csv(reduced_data2, "outputs/data/prepared_gss2.csv")


         