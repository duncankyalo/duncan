
#load libraries

library(dplyr)
library(ggplot2)
library(readxl)

#import excel file
data <- read_excel("E:/R/r.xlsx")


#Create data frame from the table

data <- data.frame(
  Dates = as.Date(c("2009-08-01","2022-07-29")),
  Seasons = c("Drought", "Dry", "Wet"),
  Bull = c(data$"Bull"),
  Cow = c(data$"Cow"),
  Heifer = c(data$"Heifer"),
  Steer = c(data$"Steer"))



#Explore the data

summary(data)


# Visualize the data

ggplot(data, aes(x = Dates, y = Bull)) +
  geom_line(color = "blue", title = "Bull")  +
  geom_line(aes(y = Cow), color = "green", title = "Cow")  +
  geom_line(aes(y = Heifer), color = "red", title = "Heifer")  +
  geom_line(aes(y = Steer), color = "purple", title = "Steer")   +
  facet_wrap(~ Seasons) +
  labs(title = "Livestock Prices by Season", x = "Date", y = "Price") +
  theme_bw()


## Visualize the data

ggplot(data, aes(x = Dates, y = Bull)) +
  geom_jitter(color = "blue", title = "Bull")  +
  geom_point(aes(y = Cow), color = "green", title = "Cow")  +
  geom_point(aes(y = Heifer), color = "red", title = "Heifer")  +
  geom_point(aes(y = Steer), color = "purple", title = "Steer")   +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ Seasons) +
  guides(color = guide_legend()) +
  labs(title = "Livestock Prices by Season", x = "Date", y = "Price") +
  theme_bw()

#time series analysis
ts_data <- ts(data, frequency = 12)  #monthly data
 
# Plot the time series
 plot(ts_data, main = "Time Series Plot")   
 
 
 
 
 
# percentage change in price from 2009 to 2022 to get a basic idea of price movements.

price_change <- ((data[154, 3:6] - data[1, 3:6]) / data[1, 3:6]) * 100


# Print the percentage change in price

print(price_change)



#inferences

The graph shows a significant increase in cow prices from 2009 to 2022,
seen in both dry and rainy seasons.
The price increase was more significant during the dry season,
reaching almost 12%, compared to a lesser 8% during the rainy season. 
Steers, on the other hand, had a decrease in price throughout the same period in both seasons.
The decrease was significant in the dry season with  6% decrease compared to  4% decrease in the wet season.

