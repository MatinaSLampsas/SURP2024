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
library(lubridate)

hpi_data <- read_excel("ATNHPIUS06079A.xls", skip = 10)
hpi_data <- hpi_data %>%
  mutate(
    Year = year(ymd(observation_date)),  
    HPI = ATNHPIUS06079A  
  )
base_hpi <- hpi_data$HPI[hpi_data$Year == 2019]
hpi_data <- mutate(hpi_data, Adjustment_Factor = HPI / base_hpi)

adjusted_data <- combined_data %>%
  left_join(hpi_data, by = "Year") %>%
  mutate(Adjusted_Price = `L/C Price` * Adjustment_Factor)  # Assuming 'Price' is your column for property prices

View(adjusted_data)
print(colnames(data))
