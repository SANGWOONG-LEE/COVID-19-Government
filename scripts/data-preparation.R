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
         health,
         helpsick,
         helppoor)
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
         health,
         helpsick,
         helppoor)
reduced_data1$year <- "2018"
reduced_data2$year <- "2021"
c_data <- rbind(reduced_data1, reduced_data2)
# Modify scales name for simplicity
c_data <-
  c_data  %>% 
  mutate(nataid = case_when(
    nataid == 1 ~ "Too little",
    nataid == 2 ~ "About right",
    nataid == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natarms = case_when(
    natarms == 1 ~ "Too little",
    natarms == 2 ~ "About right",
    natarms == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natchld = case_when(
    natchld == 1 ~ "Too little",
    natchld == 2 ~ "About right",
    natchld == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natcity = case_when(
    natcity == 1 ~ "Too little",
    natcity == 2 ~ "About right",
    natcity == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natcrime = case_when(
    natcrime == 1 ~ "Too little",
    natcrime == 2 ~ "About right",
    natcrime == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natdrug = case_when(
    natdrug == 1 ~ "Too little",
    natdrug == 2 ~ "About right",
    natdrug == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(nateduc = case_when(
    nateduc == 1 ~ "Too little",
    nateduc == 2 ~ "About right",
    nateduc == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natenrgy = case_when(
    natenrgy == 1 ~ "Too little",
    natenrgy == 2 ~ "About right",
    natenrgy == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natenvir = case_when(
    natenvir == 1 ~ "Too little",
    natenvir == 2 ~ "About right",
    natenvir == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natfare = case_when(
    natfare == 1 ~ "Too little",
    natfare == 2 ~ "About right",
    natfare == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natheal = case_when(
    natheal == 1 ~ "Too little",
    natheal == 2 ~ "About right",
    natheal == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natmass = case_when(
    natmass == 1 ~ "Too little",
    natmass == 2 ~ "About right",
    natmass == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natpark = case_when(
    natpark == 1 ~ "Too little",
    natpark == 2 ~ "About right",
    natpark == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natrace = case_when(
    natrace == 1 ~ "Too little",
    natrace == 2 ~ "About right",
    natrace == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natroad = case_when(
    natroad == 1 ~ "Too little",
    natroad == 2 ~ "About right",
    natroad == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natsci = case_when(
    natsci == 1 ~ "Too little",
    natsci == 2 ~ "About right",
    natsci == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(natsoc = case_when(
    natsoc == 1 ~ "Too little",
    natsoc == 2 ~ "About right",
    natsoc == 3 ~ "Too much"))
c_data <-
  c_data  %>% 
  mutate(health = case_when(
    health == 1 ~ "Excellent",
    health == 2 ~ "Good",
    health == 3 ~ "Fair",
    health == 4 ~ "Poor"))
c_data <-
  c_data  %>% 
  mutate(helpsick = case_when(
    helpsick == 1 ~ "Yes",
    helpsick == 2 ~ "Somewhat",
    helpsick == 3 ~ "Both",
    helpsick == 5 ~ "No"))
c_data <-
  c_data  %>% 
  mutate(helppoor = case_when(
    helppoor == 1 ~ "Yes",
    helppoor == 2 ~ "Somewhat",
    helppoor == 3 ~ "Both",
    helppoor == 5 ~ "No"))

#### Save ####
write_csv(reduced_data1, "outputs/data/prepared_gss1.csv")
write_csv(reduced_data2, "outputs/data/prepared_gss2.csv")
write_csv(c_data, "outputs/data/combined_data.csv")


         