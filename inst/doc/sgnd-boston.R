## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(smoothic)

# For data manipulation and plotting if required
library(dplyr)
library(ggplot2)
library(tidyr)

## -----------------------------------------------------------------------------
fit <- smoothic(
  formula = lcmedv ~ .,
  data = bostonhouseprice2,
  family = "sgnd", # Smooth Generalized Normal Distribution
  model = "mpr" # model location and scale
)

## -----------------------------------------------------------------------------
summary(fit)

fit$kappa # shape estimate

## ---- fig.width=10, fig.height=8----------------------------------------------
telescope_df <- fit$telescope_df # dataframe with standardized coefficient values for each epsilon in the telescope

# Variable names (without the response & intercept terms)
p <- ncol(bostonhouseprice2) - 1
names_coef <- names(coef(fit))
names_coef <- names_coef[!(names_coef %in% c(
  "intercept_0_beta",
  "intercept_0_alpha",
  "nu_0"
))]

# Tidy dataframe for plotting
plot_df <- telescope_df %>%
  select(
    epsilon,
    contains(c("beta", "alpha")),
    -c("beta_0", "alpha_0")
  ) %>%
  rename_all(~ c("epsilon", names_coef)) %>% # rename columns
  pivot_longer(-epsilon) %>%
  mutate(type = case_when( # extract whether variable is location or scale
    grepl("_beta", name) ~ "Location",
    grepl("alpha", name) ~ "Scale"
  )) %>%
  mutate(coef = sub("_.*", "", name)) # extract variable name


# Plot
plot_df %>%
  ggplot(aes(
    x = log(epsilon), # log scale
    y = value,
    colour = coef
  )) +
  facet_wrap(~type) +
  geom_line() +
  labs(y = "Standardized Coefficient Value") +
  theme_bw()
