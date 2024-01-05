### Polishing figures & tables ----

## Functions ----

# function to compute summary statistics
summary_stats <- function(data, var) {
  data |> 
    na.omit() |> 
    summarise(
      mean = mean(!!var, na.rm = TRUE),
      median = median(!!var, na.rm = TRUE),
      min = min(!!var, na.rm = TRUE),
      max = max(!!var, na.rm = TRUE),
      sd = sd(!!var, na.rm = TRUE)
    )
}

# numeric variables of interest
vars_of_interest <- c("profit", "revenue", "budget", "runtime", "vote_average")

# 'for' loop to compute summary statistics for each variable
movie_stats <- list()

for (var in vars_of_interest) {
  movie_stats[[var]] <- summary_stats(movies_condensed, sym(var))
}

# combine the results into a data frame
movie_stats_df <- bind_rows(movie_stats) |> 
  mutate(variable = vars_of_interest) |> 
  relocate(variable)

# display data table
datatable(movie_stats_df) |> 
  formatRound(columns = 2:5, digits = 2)

## Genre table ----

# creating a table of genres and how it relates to profit

# separate genres into individual rows
genres_profit <- movies_condensed |> 
  separate_rows(split_genres, sep = "\\|") |> 
  filter(!is.na(profit))

# summarize data to find the leading genre based on profit
genre_summary <- genres_profit |> 
  na.omit() |> 
  group_by(split_genres) |> 
  summarise(
    total_profit = sum(profit, na.rm = TRUE),
    mean_profit = mean(profit, na.rm = TRUE),
    median_profit = median(profit, na.rm = TRUE),
    count = n()
  ) |> 
  arrange(desc(total_profit))

# clean up and capitalize column names
colnames(genre_summary) <- gsub("_", " ", make.names(colnames(genre_summary)))
colnames(genre_summary) <- str_to_title(colnames(genre_summary))

# display data table
datatable(genre_summary) |> 
  formatRound(columns = 2:4, digits = 2)

## Correlation coefficents ----

# creating a table with correlation coefficents of variables of interest in relation to profit
movies_correlation <- movies_condensed |> 
  na.omit() |> 
  select(vars_of_interest) |> 
  cor() |> 
  round(digits = 3) |> 
  as.data.frame()

# capitalize and replace underscores in column names
colnames(movies_correlation) <- str_to_title(str_replace_all(colnames(movies_correlation), "_", " "))

# display data table
datatable(movies_correlation[1, , drop = FALSE], options = list(pageLength = 10))


## Adult table ----

# creating a table of adult content and how it relates to profit

# separate adult content into individual rows
adult_profit <- movies_condensed |> 
  filter(!is.na(profit)) |>
  mutate(adult = as.character(adult)) |>
  separate_rows(adult, sep = "\\|")

# summarize data to find the relationship between adult content and profit
adult_summary <- adult_profit |> 
  na.omit() |> 
  group_by(adult) |> 
  summarise(
    total_profit = sum(profit, na.rm = TRUE),
    mean_profit = mean(profit, na.rm = TRUE),
    median_profit = median(profit, na.rm = TRUE),
    count = n()
  ) |> 
  arrange(desc(total_profit))

# clean up and capitalize column names
colnames(adult_summary) <- gsub("_", " ", make.names(colnames(adult_summary)))
colnames

datatable(adult_summary) |> 
  formatRound(columns = 2:4, digits = 2)
