### Data collection ----

## load packages and data ----
library(tidyverse)
library(stringr)
library(knitr)
library(ggthemes)
library(naniar)
library(DT)
library(gt)
library(tibble)

movies_data <- read_csv("data/movies_dataset.csv")

# saving tidy data
write_csv(movies_condensed, "data/movies_condensed.csv")

# saving codebook
write_csv(movies_condensed_codebook, "data/movies_condensed_codebook.csv")
