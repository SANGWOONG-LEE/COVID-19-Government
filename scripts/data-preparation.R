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
         eqwlth)
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
         eqwlth)
reduced_data1$year <- "2018"
reduced_data2$year <- "2021"
c_data <- rbind(reduced_data1, reduced_data2)
reduced_data1  <- 
  reduced_data1  %>% 
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
         eqwlth2018 = eqwlth)
reduced_data2  <-
  reduced_data2  %>% 
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
         eqwlth2021 = eqwlth)
# Modify scales name for simplicity
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(nataid2018 = case_when(
    nataid2018 == 1 ~ "Too little",
    nataid2018 == 2 ~ "About right",
    nataid2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(nataid2021 = case_when(
    nataid2021 == 1 ~ "Too little",
    nataid2021 == 2 ~ "About right",
    nataid2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natarms2018 = case_when(
    natarms2018 == 1 ~ "Too little",
    natarms2018 == 2 ~ "About right",
    natarms2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natarms2021 = case_when(
    natarms2021 == 1 ~ "Too little",
    natarms2021 == 2 ~ "About right",
    natarms2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natchld2018 = case_when(
    natchld2018 == 1 ~ "Too little",
    natchld2018 == 2 ~ "About right",
    natchld2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natchld2021 = case_when(
    natchld2021 == 1 ~ "Too little",
    natchld2021 == 2 ~ "About right",
    natchld2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natcity2018 = case_when(
    natcity2018 == 1 ~ "Too little",
    natcity2018 == 2 ~ "About right",
    natcity2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natcity2021 = case_when(
    natcity2021 == 1 ~ "Too little",
    natcity2021 == 2 ~ "About right",
    natcity2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natcrime2018 = case_when(
    natcrime2018 == 1 ~ "Too little",
    natcrime2018 == 2 ~ "About right",
    natcrime2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natcrime2021 = case_when(
    natcrime2021 == 1 ~ "Too little",
    natcrime2021 == 2 ~ "About right",
    natcrime2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natdrug2018 = case_when(
    natdrug2018 == 1 ~ "Too little",
    natdrug2018 == 2 ~ "About right",
    natdrug2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natdrug2021 = case_when(
    natdrug2021 == 1 ~ "Too little",
    natdrug2021 == 2 ~ "About right",
    natdrug2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(nateduc2018 = case_when(
    nateduc2018 == 1 ~ "Too little",
    nateduc2018 == 2 ~ "About right",
    nateduc2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(nateduc2021 = case_when(
    nateduc2021 == 1 ~ "Too little",
    nateduc2021 == 2 ~ "About right",
    nateduc2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natenrgy2018 = case_when(
    natenrgy2018 == 1 ~ "Too little",
    natenrgy2018 == 2 ~ "About right",
    natenrgy2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natenrgy2021 = case_when(
    natenrgy2021 == 1 ~ "Too little",
    natenrgy2021 == 2 ~ "About right",
    natenrgy2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natenvir2018 = case_when(
    natenvir2018 == 1 ~ "Too little",
    natenvir2018 == 2 ~ "About right",
    natenvir2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natenvir2021 = case_when(
    natenvir2021 == 1 ~ "Too little",
    natenvir2021 == 2 ~ "About right",
    natenvir2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natfare2018 = case_when(
    natfare2018 == 1 ~ "Too little",
    natfare2018 == 2 ~ "About right",
    natfare2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natfare2021 = case_when(
    natfare2021 == 1 ~ "Too little",
    natfare2021 == 2 ~ "About right",
    natfare2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natheal2018 = case_when(
    natheal2018 == 1 ~ "Too little",
    natheal2018 == 2 ~ "About right",
    natheal2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natheal2021 = case_when(
    natheal2021 == 1 ~ "Too little",
    natheal2021 == 2 ~ "About right",
    natheal2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natmass2018 = case_when(
    natmass2018 == 1 ~ "Too little",
    natmass2018 == 2 ~ "About right",
    natmass2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natmass2021 = case_when(
    natmass2021 == 1 ~ "Too little",
    natmass2021 == 2 ~ "About right",
    natmass2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natpark2018 = case_when(
    natpark2018 == 1 ~ "Too little",
    natpark2018 == 2 ~ "About right",
    natpark2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natpark2021 = case_when(
    natpark2021 == 1 ~ "Too little",
    natpark2021 == 2 ~ "About right",
    natpark2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natrace2018 = case_when(
    natrace2018 == 1 ~ "Too little",
    natrace2018 == 2 ~ "About right",
    natrace2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natrace2021 = case_when(
    natrace2021 == 1 ~ "Too little",
    natrace2021 == 2 ~ "About right",
    natrace2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natroad2018 = case_when(
    natroad2018 == 1 ~ "Too little",
    natroad2018 == 2 ~ "About right",
    natroad2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natroad2021 = case_when(
    natroad2021 == 1 ~ "Too little",
    natroad2021 == 2 ~ "About right",
    natroad2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natsci2018 = case_when(
    natsci2018 == 1 ~ "Too little",
    natsci2018 == 2 ~ "About right",
    natsci2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natsci2021 = case_when(
    natsci2021 == 1 ~ "Too little",
    natsci2021 == 2 ~ "About right",
    natsci2021 == 3 ~ "Too much",
  ))
reduced_data1 <- 
  reduced_data1 %>% 
  mutate(natsoc2018 = case_when(
    natsoc2018 == 1 ~ "Too little",
    natsoc2018 == 2 ~ "About right",
    natsoc2018 == 3 ~ "Too much",
  ))
reduced_data2 <- 
  reduced_data2 %>% 
  mutate(natsoc2021 = case_when(
    natsoc2021 == 1 ~ "Too little",
    natsoc2021 == 2 ~ "About right",
    natsoc2021 == 3 ~ "Too much",
  ))
c_data <-
  c_data  %>% 
  mutate(nataid = case_when(
    nataid == 1 ~ "Too little",
    nataid == 2 ~ "About right",
    nataid == 3 ~ "Too much"))

    
#### Save ####
write_csv(reduced_data1, "outputs/data/prepared_gss1.csv")
write_csv(reduced_data2, "outputs/data/prepared_gss2.csv")
write_csv(c_data, "outputs/data/combined_data.csv")


         