pacman::p_load(broom, kableExtra, knitr, rio, tidyverse)
brfss <- import("data/brfss.csv") |> filter(region != "")
brfss_total <- brfss |> filter(stratification == "Total")
options(scipen=999)

state_participation <-
  brfss_total |>
  group_by(region, year) |>
  summarize(
    n_states = length(unique(location_desc))
  ) |>
  pivot_wider(names_from = year, values_from = n_states)

lm_no_physical_activity_2011 <-
  lm(obese ~ no_physical_activity,
     brfss_total |> filter(year == 2011),
     weights = sample_size)

lm_no_physical_activity_2012 <-
  lm(obese ~ no_physical_activity,
     brfss_total |> filter(year == 2012),
     weights = sample_size)

lm_no_physical_activity_2013 <-
  lm(obese ~ no_physical_activity,
     brfss_total |> filter(year == 2013),
     weights = sample_size)

lm_no_physical_activity_2014 <-
  lm(obese ~ no_physical_activity,
     brfss_total |> filter(year == 2014),
     weights = sample_size)

lm_no_physical_activity_2015 <-
  lm(obese ~ no_physical_activity,
     brfss_total |> filter(year == 2015),
     weights = sample_size)

lm_no_physical_activity_2016 <-
  lm(obese ~ no_physical_activity,
     brfss_total |> filter(year == 2016),
     weights = sample_size)

y_intercept_over_time <-
  tibble(
    year = 2011:2016,
    y_intercept = c(lm_no_physical_activity_2011$coefficients[1],
                    lm_no_physical_activity_2012$coefficients[1],
                    lm_no_physical_activity_2013$coefficients[1],
                    lm_no_physical_activity_2014$coefficients[1],
                    lm_no_physical_activity_2015$coefficients[1],
                    lm_no_physical_activity_2016$coefficients[1])
  )

slope_over_time <-
  tibble(
    year = 2011:2016,
    slope = c(lm_no_physical_activity_2011$coefficients[2],
              lm_no_physical_activity_2012$coefficients[2],
              lm_no_physical_activity_2013$coefficients[2],
              lm_no_physical_activity_2014$coefficients[2],
              lm_no_physical_activity_2015$coefficients[2],
              lm_no_physical_activity_2016$coefficients[2])
  )