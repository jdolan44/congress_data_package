library(tidyverse)
library(ggthemes)

theme_set(theme_minimal(base_size = 12))

# read from the raw data file.
congress_data <- read_csv("../raw_data/allCongressDataPublishV2.csv")

#found 8 rows where the majority of major variables are missing.
#all of them can be found with is.na(state)

congress_data <-congress_data %>%
  filter(!is.na(state))

# 1 congressman found with the party affiliation "Republican-Conservative".
# changed to "Republican" for consistency.
# 1 representative from PR with a missing party. in other entries with the same
# sponID, he is listed as a Democrat.
congress_data <- congress_data %>%
  mutate( party= case_match(
    party,
    "Republican-Conservative" ~ "Republican",
    "Republican" ~ "Republican",
    "Democrat" ~ "Democrat",
    "Independent" ~ "Independent",
    NA ~ "Democrat"
  ))
 
# create a new table for session characteristics for consistency.
session_data <- congress_data %>%
  group_by(congNum, partyControl, demSeats, repSeats, otherSeats) %>%
  summarise()

 
# drop unnecessary columns
congress_data $partyControl <- NULL
congress_data $demSeats <- NULL
congress_data $repSeats <- NULL
congress_data $otherSeats <-NULL

#save tables to data folder

write_csv(congress_data, "../data/congress_data.csv")
write_csv(session_data, "../data/session_data.csv")
 

