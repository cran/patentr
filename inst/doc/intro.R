## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----install, eval=FALSE------------------------------------------------------
#  # stable version from CRAN
#  install.packages("patentr")
#  
#  # development version from GitHub
#  remotes::install_github("JYProjs/patentr")

## ----setup, message=FALSE-----------------------------------------------------
library(patentr)
library(tibble)    # for the tibble data containers
library(magrittr)  # for the pipe (%>%) operator
library(dplyr)     # to work with patent data
library(lubridate) # to work with dates

## ----acquire, eval=FALSE------------------------------------------------------
#  # acquire data from USPTO
#  get_bulk_patent_data(
#    year = rep(1976, 2),            # each week must have a corresponding year
#    week = 1:2,                     # each week corresponds element-wise to a year
#    output_file = "temp_output.csv" # output file in which patent data is stored
#  )
#  
#  # import data into R
#  patent_data <- read.csv("temp_output.csv") %>%
#    as_tibble() %>%
#    mutate(App_Date = as_date(App_Date),
#           Issue_Date=as_date(Issue_Date))
#  
#  # delete local file (optional - but we no longer need it for this tutorial)
#  file.remove("temp_output.csv")

## ----set_data, include=FALSE--------------------------------------------------
data("y1976w1")
patent_data <- y1976w1 %>%
  as_tibble %>%
  mutate(App_Date = as_date(App_Date),
         Issue_Date=as_date(Issue_Date))

## ----peek---------------------------------------------------------------------
tail(patent_data)

str(patent_data)

## ----example,fig.width=5------------------------------------------------------
# calculate time from application to issue (in days)
lag_time <- patent_data %>%
  transmute(Lag = Issue_Date - App_Date) %>%
  pull(Lag) %>%
  as.numeric

# get quantitative summary
summary(lag_time)

# plot as histogram
hist(lag_time,
     main = "Histogram of delay before issue",
     xlab = "Time (days)", ylab = "Count")

