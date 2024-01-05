### Data cleaning ----

## Looking at the variables that I want to analyze/focus on ----
colnames(movies_data)

movies_condensed <- movies_data |> 
  select(id, title, vote_average, vote_count, release_date, runtime, adult,
         budget, original_language, popularity, genres,
         spoken_languages, revenue)

# looking at movies in the last decade
movies_condensed <- movies_condensed |> 
  filter(release_date >= 2013-01-01)


## Manipulating data to save as movies_condensed ----

# switching zeros for NAs 
movies_condensed <- movies_condensed |> 
  mutate(vote_average = na_if(vote_average, 0),
         vote_count = na_if(vote_count, 0),
         revenue = na_if(revenue, 0),
         runtime = na_if(runtime, 0),
         budget = na_if(budget, 0),
         popularity = na_if(popularity, 0))


# creating a variable called profit
movies_condensed <- movies_condensed |> 
  mutate(profit = revenue - budget)

# seeing which movies original language in English
movies_condensed <- movies_condensed |>
  mutate(english = 1*(original_language == "en"),
         english = factor(english))

# changing adult to 1 or 0 for true or false
movies_condensed <- movies_condensed |>
  mutate(adult = 1*(adult),
         adult = factor(adult))


## Checking for missingness ----

# using gg_miss_var()
fig_18 <- movies_condensed |> 
  gg_miss_var()

# ggsave
ggsave(filename = "figures/fig_18.png", fig_18, width = 6, height = 4)

# using miss_var_summary()
movies_condensed |> 
  miss_var_summary()

# total missingness
sum(is.na(movies_condensed))