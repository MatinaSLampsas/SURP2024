setwd("C:/Users/kalis/OneDrive/Documents/Housing_research")
library(readxl)
library(dplyr)
data <- read_excel("San Luis Obispo County Sales 2019.xlsx", skip = 1) %>%
  mutate(Year = 2019)
View(data)

# Read the 2021 data and add a year column
data2 <- read_excel("San Luis Obispo County Sales 2021.xlsx", skip = 1) %>%
  mutate(Year = 2021)
View(data2)

# Read the 2022 data and add a year column
data3 <- read_excel("San Luis Obispo County Sales 2022.xlsx", skip = 1) %>%
  mutate(Year = 2022)
View(data3)

combined_data <- bind_rows(data, data2, data3)
View(combined_data)

SHPI <- read_excel("ATNHPIUS06079A.xls", skip = 10)
View(SHPI)
SHPI <- mutate(SHPI, Adjustment_Factor = HPI / SHPI$HPI[SHPI$Year == 2019])
