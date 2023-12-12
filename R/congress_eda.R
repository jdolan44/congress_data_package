
library(tidyverse)
library(ggthemes)
library(patchwork)

theme_set(theme_minimal(base_size = 12))

#load data
congress_data <- read_csv("data/congress_data.csv")

#party distribution plot
congress_data %>%
  ggplot(aes(x=congNum, fill=party)) +
  geom_bar() +
  scale_fill_manual(values=c("#5156e0", "#00aa00", "#e05151")) +
  labs(
    title="Party Distribution of Congress Over Time",
    x="Congress Number",
    y="Number of Seats",
    fill="Party"
  )

#gender distribution plot
congress_data %>%
  ggplot(aes(x=congNum, fill=gender)) +
  geom_bar(color="black") +
  scale_fill_manual(values=c("#e05151", "#5156e0")) +
  labs(
    title="Gender Distribution of Congress",
    x="Congress Number",
    y="Number of Seats",
    fill="Gender"
  )

# distribution of black and hispanic representatives
num_black <- congress_data %>%
  filter(black==1) %>%
  ggplot(aes(x=congNum, fill=party)) +
  geom_bar(color="black") +
  scale_fill_manual(values=c("#5156e0", "#00aa00", "#e05151")) +
  labs(x="Congress Number", y="Black Representatives") +
  theme(axis.title.x = element_blank())

num_hispanic <- congress_data %>%
  filter(hispanic == 1) %>%
  ggplot(aes(x=congNum, fill=party)) +
  geom_bar(color="black") +
  theme(legend.position = "none") +
  scale_fill_manual(values=c("#5156e0", "#e05151")) +
  labs(x="Congress Number", y="Hispanic Representatives")

num_black / num_hispanic

# average age over time plot
congress_data %>%
  ggplot(aes(x=congNum, y=age)) +
  geom_point(color="lightblue", alpha=0.5) +
  geom_smooth(color="#512d6d",fill="darkgreen") +
  labs(x="Congress Number",y="Age")

# number terms v. bills sponsored plot
congress_data %>%
  group_by(numberTerms=numberTerms%/%3) %>%
  summarise(mean_numSpon = mean(numSpon)) %>%
  ggplot(aes(x=factor(numberTerms*3), y=mean_numSpon)) +
  geom_bar(stat='identity', fill="#553E4E") +
  labs(
    x="Number of Terms Served",
    y="Average # of Bills Sponsored"
  )

# number terms v. pass percent plot
congress_data %>%
  filter(!is.na(passPrcnt)) %>%
  group_by(numberTerms=numberTerms%/%3) %>%
  summarise(mean_passprcnt = mean(passPrcnt)) %>%
  ggplot(aes(x=factor(numberTerms*3), y=mean_passprcnt)) +
  geom_bar(stat='identity', fill="#553E4E") +
  labs(
    x="Number of Terms Served",
    y="Pass Percentage"
  )

# age v. bills sponsored plot
congress_data %>%
  group_by(age=age%/%5) %>%
  summarise(mean_numSpon = mean(numSpon)) %>%
  ggplot(aes(x=factor(age*5), y=mean_numSpon)) +
  geom_bar(stat='identity', fill="#553E4E") +
  labs(x="Age Group", y="Average # of Bills Sponsored")

# age v. pass percent plot
congress_data %>%
  filter(!is.na(passPrcnt)) %>%
  group_by(age=age%/%5) %>%
  summarise(mean_passprcnt = mean(passPrcnt)) %>%
  ggplot(aes(x=factor(age*5), y=mean_passprcnt)) +
  geom_bar(stat='identity', fill="#553E4E") +
  labs(
    x="Age Group",
    y="Pass Percentage"
  )

#gender v. bills sponsored plot
congress_data %>%
  group_by(gender) %>%
  ggplot(aes(x=gender, y=numSpon, color=gender)) +
  scale_color_manual(values=c("#e05151", "#5156e0")) +
  geom_boxplot(outlier.shape = NA, color="black") +
  geom_jitter(width=0.35, alpha=0.2) +
  ylim(0, 50) +
  labs(x="", y="# of Bills Sponsored", color="Gender")

# gender v. pass percent plot
congress_data %>%
  filter(!is.na(passPrcnt)) %>%
  group_by(age=age%/%5) %>%
  summarise(mean_passprcnt = mean(passPrcnt)) %>%
  ggplot(aes(x=factor(age*5), y=mean_passprcnt)) +
  geom_bar(stat='identity', fill="#553E4E") +
  labs(
    x="Age Group",
    y="Pass Percentage"
  )