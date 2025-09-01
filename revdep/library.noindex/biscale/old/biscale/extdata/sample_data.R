# create sample data

library(dplyr)
library(tidycensus)
library(tigris)
library(sf)

# download median income data
get_acs(year = 2017, geography = "tract", variables = "B19019_001", state = 29, county = 510) %>%
  select(GEOID, estimate) %>%
  rename(medInc = estimate) -> medianInc

# download race data
get_acs(year = 2017, geography = "tract", table = "B02001", state = 29, county = 510, output = "wide") %>%
  select(GEOID, B02001_001E, B02001_002E) %>%
  rename(total = B02001_001E, white = B02001_002E) %>%
  mutate(pctWhite = white/total*100) %>%
  select(GEOID, pctWhite) -> race

# download tract geometry
tracts <- tracts(state = 29, county = 510, class = "sf") %>%
  select(GEOID)

# combine tract data with geometry
tracts <- tracts %>%
  left_join(., race, by = "GEOID") %>%
  left_join(., medianInc, by = "GEOID")

stl_race_income <- tracts

usethis::use_data(stl_race_income, overwrite = TRUE)

stl_race_income_point <- st_centroid(stl_race_income)

usethis::use_data(stl_race_income_point, overwrite = TRUE)

