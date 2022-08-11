library(tidyr)
library(ggplot2)
library(lubridate)

load("~/Downloads/house_prices.rda")
house_prices
write.csv(house_prices, file = "house_prices.csv")
house_prices <- read_csv("Downloads/house_prices.csv")
house_prices$date <- as.Date("2020-01-01")
 house_prices$year <- year(house_prices$date)
 house_prices


ggplot(data = house_prices, aes(x = year, y = house_price_index)) +
  geom_line() +
  facet_wrap(~ state, nrow = 2) +
  scale_x_discrete(breaks = c("1980", "2000", "2020"),
                   labels = c("'80", "'00", "'20"))

house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value", -year, -state)

ggplot(house_reshaped, aes(x=year, y=value, color=state)) + 
  geom_line() +
  facet_wrap(~ measure, nrow = 2) +
  scale_x_discrete(breaks=c('1980','2000','2020'), labels=c('80', '00', '20'))

