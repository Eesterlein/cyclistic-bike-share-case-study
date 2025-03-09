#Analyze Data

# Mean & median ride length by rider type (2019)
divvy_2019_q1 %>%
  group_by(usertype) %>%
  summarise(
    mean_ride_length = mean(ride_length),
    median_ride_length = median(ride_length)
  )

# Mean & median ride length by rider type (2020)
divvy_2020_q1 %>%
  group_by(member_casual) %>%
  summarise(
    mean_ride_length = mean(ride_length),
    median_ride_length = median(ride_length)
  )

# Count rides per day of the week (2019)
divvy_2019_q1 %>%
  group_by(day_of_week, usertype) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides))

# Count rides per day of the week (2020)
divvy_2020_q1 %>%
  group_by(day_of_week, member_casual) %>%
  summarise(total_rides = n()) %>%
  arrange

library(ggplot2)

# Ride Usage by Day (2020)
ggplot(divvy_2020_q1, aes(x = day_of_week, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(title = "Cyclistic Bike Usage by Day of the Week",
       x = "Day of the Week", 
       y = "Number of Rides",
       fill = "Rider Type") +
  theme_minimal()

#ride length by rider type
ggplot(divvy_2020_q1, aes(x = member_casual, y = ride_length, fill = member_casual)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 60)) +  # Adjusts view to show rides up to 60 min
  labs(title = "Ride Duration Distribution by Rider Type",
       x = "Rider Type", 
       y = "Ride Length (Minutes)") +
  theme_minimal()

#10 most used start stations
divvy_2020_q1 %>%
  group_by(start_station_name, member_casual) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 10)

#seasonal trends
divvy_2020_q1 %>%
  mutate(month = format(started_at, "%B")) %>%  # Extracts month name (January, February, etc.)
  group_by(month, member_casual) %>%
  summarise(total_rides = n(), .groups = "drop") %>%
  arrange(desc(total_rides))

#seasonal trends bar chart
ggplot(divvy_2020_q1 %>% mutate(month = format(started_at, "%B")), 
       aes(x = month, fill = member_casual)) +
  geom_bar(position = "dodge") +
  labs(title = "Cyclistic Ridership by Month (2020 Q1)",
       x = "Month", 
       y = "Number of Rides",
       fill = "Rider Type") +
  theme_minimal()

#bike preference 
divvy_2020_q1 %>%
  group_by(rideable_type, member_casual) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides))
