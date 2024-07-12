setwd("C:/Users/kalis/OneDrive/Documents/Housing_research")
library(readxl)
data = read_excel("house_data.xlsx")
View(data)
library(dplyr)

summary_table <- data %>%
  group_by(CITY) %>%
  summarise(ZIP_CODES = toString(unique(`ZIP OR POSTAL CODE`)), .groups = 'drop')

print(summary_table, n = nrow(summary_table))


print(summary_table)
print(colnames(data))

slo_zip_codes <- c("93401", "93405")  # Define SLO ZIP codes
data <- data %>%
  mutate(in_slo = if_else(`ZIP OR POSTAL CODE` %in% slo_zip_codes, 1, 0))
