#Load Packages
install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)

#Load and Check Data
divvy_2019_q1 <- read_csv("Divvy_Trips_2019_Q1.csv")
glimpse(divvy_2019_q1)

divvy_2020_q1 <- read_csv("Divvy_Trips_2020_Q1.csv")
glimpse(divvy_2020_q1)
