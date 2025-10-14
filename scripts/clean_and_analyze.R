library(tidyverse)
library(lubridate)
library(ggplot2)

#Load dataset
data <- read_csv("data/hotel_bookings.csv")

# View structure
glimpse(data)

# -- Data Cleaning --
clean_data <- data %>%
  drop_na() %>%
  mutate(
    arrival_date = make_date(
      year = arrival_date_year,
      month = match(arrival_date_month, month.name),
      day = arrival_date_day_of_month
    ),
    is_canceled = as.logical(is_canceled)
  )
head(clean_data$arrival_date)


# -- Basic Summary --
summary_stats <- clean_data %>%
  summarise(
    total_bookings = n(),
    total_cancellations = sum(is_canceled),
    cancellation_rate = round(mean(is_canceled) * 100, 2)
  )
print(summary_stats)


# -- Cancellations by Country --
cancel_by_country <- clean_data %>%
  group_by(country) %>%
  summarise(
    cancellations = sum(is_canceled),
    total = n(),
    cancel_rate = round((cancellations / total) * 100, 2)
  ) %>%
  arrange(desc(cancel_rate))

head(cancel_by_country)


# -- Lead Time by Hotel Type --
lead_time_summary <- clean_data %>%
  group_by(hotel) %>%
  summarise(
    avg_lead_time = mean(lead_time),
    median_lead_time = median(lead_time)
  )
print(lead_time_summary)


# -- Monthly Booking Trends --
monthly_trends <- clean_data %>%
  group_by(month = floor_date(arrival_date, "month")) %>%
  summarise(total_bookings = n())
head(monthly_trends)


# -- Visualization 1: Bookings Over Time --
plot1 <- ggplot(monthly_trends, aes(x = month, y = total_bookings)) +
  geom_line() +
  labs(title = "Hotel Bookings Over Time", x = "Month", y = "Bookings") +
  theme_minimal()

ggsave("visuals/bookings_over_time.png", plot1, width = 7, height = 4)

# -- Visualization 2: Cancellations by Hotel Type --
plot2 <- clean_data %>%
  group_by(hotel) %>%
  summarise(cancellations = sum(is_canceled)) %>%
  ggplot(aes(x = hotel, y = cancellations, fill = hotel)) +
  geom_col(show.legend = FALSE) +
  labs(title = "Cancellations by Hotel Type", x = "Hotel Type", y = "Count") +
  theme_minimal()

ggsave("visuals/cancellations_by_hotel.png", plot2, width = 6, height = 4)

# -- Export Cleaned Data --
write_csv(clean_data, "cleaned_data/hotel_bookings_clean.csv")