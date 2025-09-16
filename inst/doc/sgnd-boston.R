## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(smoothic)

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

## ----fig.width=10, fig.height=8-----------------------------------------------
plot_paths(fit)

## ----fig.width=10, fig.height=8-----------------------------------------------
plot_effects(fit,
             what = c("ltax", "rm", "ldis"), # or "all" for all selected variables
             density_range = c(2.25, 3.75))

