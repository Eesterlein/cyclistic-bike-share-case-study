#review data
colnames(divvy_2019_q1)
colnames(divvy_2020_q1)

summary(divvy_2019_q1)
summary(divvy_2020_q1)

head(divvy_2019_q1)
head(divvy_2020_q1)

colSums(is.na(divvy_2019_q1))
colSums(is.na(divvy_2020_q1))

#rename column names so data sets match:
divvy_2019_q1 <- divvy_2019_q1 %>%
  rename(started_at = start_time,
         ended_at = end_time)

#convert start_at and ended_at into date-time format
divvy_2019_q1 <- divvy_2019_q1 %>%
  mutate(started_at = as.POSIXct(started_at, format="%Y-%m-%d %H:%M:%S"),
         ended_at = as.POSIXct(ended_at, format="%Y-%m-%d %H:%M:%S"))
#test
str(divvy_2019_q1$started_at)

divvy_2020_q1 <- divvy_2020_q1 %>%
  mutate(started_at = as.POSIXct(started_at, format="%Y-%m-%d %H:%M:%S"),
         ended_at = as.POSIXct(ended_at, format="%Y-%m-%d %H:%M:%S"))
#test
str(divvy_2020_q1$started_at)

#create a ride_length column
divvy_2019_q1 <- divvy_2019_q1 %>%
  mutate(ride_length = difftime(ended_at, started_at, units = "mins"))

divvy_2020_q1 <- divvy_2020_q1 %>%
  mutate(ride_length = difftime(ended_at, started_at, units = "mins"))

#create a day_of_week column
divvy_2019_q1 <- divvy_2019_q1 %>%
  mutate(day_of_week = weekdays(started_at))

divvy_2020_q1 <- divvy_2020_q1 %>%
  mutate(day_of_week = weekdays(started_at))

#test
summary(divvy_2019_q1$ride_length)
summary(divvy_2020_q1$ride_length)

table(divvy_2019_q1$day_of_week)
table(divvy_2020_q1$day_of_week)

#convert ride_length to numeric 
divvy_2019_q1 <- divvy_2019_q1 %>%
  mutate(ride_length = as.numeric(ride_length))

divvy_2020_q1 <- divvy_2020_q1 %>%
  mutate(ride_length = as.numeric(ride_length))

#test
summary(divvy_2019_q1$ride_length)
summary(divvy_2020_q1$ride_length)

#remove bad data
divvy_2019_q1 <- divvy_2019_q1 %>%
  filter(ride_length > 1 & ride_length < 1440)

divvy_2020_q1 <- divvy_2020_q1 %>%
  filter(ride_length > 1 & ride_length < 1440)

#test
summary(divvy_2019_q1$ride_length)
summary(divvy_2020_q1$ride_length)

