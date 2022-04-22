### Preamble ###
# Purpose: Obtain and prepare data about U.S citizens opinions on Government spending 
# Author: SangWoong Lee 
# Email: sangwoong.lee@mail.utoronto.ca
# Date 22 April 2022
# prerequisites: - 

### Worksapce set-up ###
library(janitor)
library(lubridate)
library(tidyverse)

set.seed(777)
sample_size <- 3000
simulate_national_spending <- 
  tibble(
    natarms = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natchld = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natcity = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natcrime = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natdrug = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    nateduc = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natenrgy = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natenvir = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natfare = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natheal = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natmass = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natpark = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natrace = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natraod = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natsci = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    natsoc = 
      round(runif(n=3000,
                  min = 1,
                  max = 3)),
    eqwlth = 
      round(runif(n=3000,
                  min = 1,
                  max = 7)),
    health = 
      round(runif(n=3000,
                  min = 1,
                  max = 4)),
    helpsick = 
      round(runif(n=3000,
                  min = 1,
                  max = 5)),
    helppoor = 
      round(runif(n=3000,
                  min = 1,
                  max = 5)),
    year = 
      sample(x = c("2018","2021"),
             size = 3000,
             replace = TRUE)
  )
  
simulate_national_spending$nataid |>  min() >= 0 
simulate_national_spending$nataid |>  max() >= 3
simulate_national_spending$natarms |>  min() >= 0 
simulate_national_spending$natarms |>  max() >= 3
simulate_national_spending$natchld |>  min() >= 0 
simulate_national_spending$natchld |>  max() >= 3
simulate_national_spending$natcity |>  min() >= 0 
simulate_national_spending$natcity |>  max() >= 3
simulate_national_spending$natcrime |>  min() >= 0 
simulate_national_spending$natcrime |>  max() >= 3
simulate_national_spending$natdrug |>  min() >= 0 
simulate_national_spending$natdrug |>  max() >= 3
simulate_national_spending$nateduc |>  min() >= 0 
simulate_national_spending$nateduc |>  max() >= 3
simulate_national_spending$natenrgy |>  min() >= 0 
simulate_national_spending$natenrgy |>  max() >= 3
simulate_national_spending$natenvir |>  min() >= 0 
simulate_national_spending$natenvir |>  max() >= 3
simulate_national_spending$natfare |>  min() >= 0 
simulate_national_spending$natfare |>  max() >= 3
simulate_national_spending$natheal |>  min() >= 0 
simulate_national_spending$natheal |>  max() >= 3
simulate_national_spending$natmass |>  min() >= 0 
simulate_national_spending$natmass |>  max() >= 3
simulate_national_spending$natpark |>  min() >= 0 
simulate_national_spending$natpark |>  max() >= 3
simulate_national_spending$natrace |>  min() >= 0 
simulate_national_spending$natrace |>  max() >= 3
simulate_national_spending$natraod |>  min() >= 0 
simulate_national_spending$natraod |>  max() >= 3
simulate_national_spending$natsci |>  min() >= 0 
simulate_national_spending$natsci |>  max() >= 3
simulate_national_spending$natsoc |>  min() >= 0 
simulate_national_spending$natsoc |>  max() >= 3
simulate_national_spending$eqwlth |>  min() >= 0 
simulate_national_spending$eqwlth |>  max() >= 7
simulate_national_spending$health |>  min() >= 0 
simulate_national_spending$health |>  max() >= 5
simulate_national_spending$helpsick |>  min() >= 0 
simulate_national_spending$helpsick |>  max() >= 5
simulate_national_spending$helppoor |>  min() >= 0 
simulate_national_spending$helppoor |>  max() >= 5
simulate_national_spending$year == 2018 | 2021
simulate_national_spending$nataid |> class() =='numeric'
simulate_national_spending$natarms |> class() =='numeric'
simulate_national_spending$natchld |> class() =='numeric'
simulate_national_spending$natcity |> class() =='numeric'
simulate_national_spending$natcrime |> class() =='numeric'
simulate_national_spending$natdrug |> class() =='numeric'
simulate_national_spending$nateduc |> class() =='numeric'
simulate_national_spending$natenrgy |> class() =='numeric'
simulate_national_spending$natenvir |> class() =='numeric'
simulate_national_spending$natfare |> class() =='numeric'
simulate_national_spending$natheal |> class() =='numeric'
simulate_national_spending$natmass |> class() =='numeric'
simulate_national_spending$natpark |> class() =='numeric'
simulate_national_spending$natrace |> class() =='numeric'
simulate_national_spending$natraod |> class() =='numeric'
simulate_national_spending$natsci |> class() =='numeric'
simulate_national_spending$natsoc |> class() =='numeric'
simulate_national_spending$eqwlth |> class() =='numeric'
simulate_national_spending$health |> class() =='numeric'
simulate_national_spending$helpsick |> class() =='numeric'
simulate_national_spending$helppoor |> class() =='numeric'
simulate_national_spending$year |> class() =='character'

