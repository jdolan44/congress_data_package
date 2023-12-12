library(tidyverse)
library(ggplot2)
library(ISLR2)
library(rsample)

# clean up data for ANOVA
congress_data_for_anova <-congress_data %>%
  filter(party!="Independent")

#-----numSpon-----

#model formula
numSpon_lm <-
  lm(numSpon ~ numberTerms + age + gender + party, data = congress_data_for_anova)
numSpon_lm

#get intervals
numSpon_intervals <- 
  reg_intervals(numSpon ~ numberTerms + age + gender + party, data = congress_data_for_anova, times = 500)
numSpon_intervals

#plot estimates
numSpon_intervals %>%
  ggplot(aes(.estimate, term)) +
  geom_vline(xintercept = 0, size = 1.5, lty = 2, color = "gray50") +
  geom_errorbar(size = 1.4, alpha = 0.7,
                aes(xmin = .lower, xmax = .upper)) +
  geom_point(size = 3)


#-----passPrcnt-----

#model formula
passPrcnt_lm <-
  lm(passPrcnt ~ numberTerms + age + gender + party, data = congress_data_for_anova)
passPrcnt_lm

#get intervals
passPrcnt_intervals <- 
  reg_intervals(passPrcnt ~ numberTerms + age + gender + party, data = congress_data_for_anova, times = 500)
passPrcnt_intervals

#plot estimates
passPrcnt_intervals %>%
  ggplot(aes(.estimate, term)) +
  geom_vline(xintercept = 0, size = 1.5, lty = 2, color = "gray50") +
  geom_errorbar(size = 1.4, alpha = 0.7,
                aes(xmin = .lower, xmax = .upper)) +
  geom_point(size = 3)
