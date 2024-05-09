library(tidyverse)
library(readxl)


WorldPopulation <- read_excel("data-raw/World_Population.xlsx", sheet = "ESTIMATES",
                               range = "A17:BZ306")  %>%
  mutate("Country_Name"= `Region, subregion, country or area *`) %>%
  pivot_longer(cols = 8:78, names_to = "Year", values_to = "Population") %>%
  select(Country_Name, Year, Population) %>%
  mutate(
    Year = as.integer(Year),
    Population = as.integer(Population)
  )

usethis::use_data(WorldPopulation, overwrite = TRUE)
