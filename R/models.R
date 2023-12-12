library(tidyverse)
library(tidymodels)
#get testing data
set.seed(123)

congress_data <- congress_data %>%
  mutate(party_binary = ifelse(party=="Democrat", 1, 0),
         gender_binary = ifelse(gender=="M", 1, 0))

congress_data_split <-
  initial_split(congress_data, prop = 0.8, strata = party)

congress_data_train <- training(congress_data_split)

congress_data_test <- testing(congress_data_split)

#get specification
gam_spec <- 
  gen_additive_mod() %>%
  set_mode("regression")

#get fit for # of bills sponsored
numspon_fit <- gam_spec %>%
  fit(numSpon ~ s(numberTerms) + s(age) + gender_binary + party_binary, data=congress_data_train)

#predict using the model
numspon_preds <- numspon_fit %>%
  predict(congress_data_test) %>%
  cbind(congress_data_test)

#glimpse the prediction cols
glimpse(numspon_preds)

#find the RMSE
numspon_preds %>% 
  rmse(truth = numSpon, estimate = .pred)

#compare predictions to actual
numspon_preds %>%
  select(numSpon, .pred)


#get fit for pass percent
passprcnt_fit <- gam_spec %>%
  fit(passPrcnt ~ s(numberTerms) + s(age) + gender_binary + party_binary, data=congress_data_train)

#predict using the model
passprcnt_preds <- passprcnt_fit %>%
  predict(congress_data_test) %>%
  cbind(congress_data_test)

#glimpse the prediction cols
glimpse(passprcnt_preds)

#find the RMSE
passprcnt_preds %>% 
  rmse(truth = passPrcnt, estimate = .pred)

#compare predictions to actual
passprcnt_preds %>%
  select(passPrcnt, .pred)

