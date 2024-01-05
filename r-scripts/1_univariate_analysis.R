### Univariate analysis ----


## Analyzing important variables

## Looking at variable revenue ----

# summary statistics for revenue
movies_condensed |> 
  na.omit() |> 
  summarise(mean = mean(revenue),
            median = median(revenue),
            min = min(revenue),
            max = max(revenue),
            sd = sd(revenue))

# creating a basic histogram for movies from the first five years of this decade (revenue)
revenue_plot_1 <- movies_condensed |>
  na.omit() |>
  filter(release_date >= "2013-01-01" & release_date <= "2019-01-01",
         revenue <= 1000000000) |> 
  ggplot(aes(x = revenue)) +
  geom_histogram(bins = 50, color = "black", fill = "slategray1") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 1000000000), labels = scales::comma) +
  scale_y_continuous(limits = c(0, 350)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Revenue", y = "Frequency",
       title = "Distribution of Movie Revenue (2013-2019)")

# creating a basic histogram for movies from the last five years of this decade (revenue)
revenue_plot_2 <- movies_condensed |>
  na.omit() |> 
  filter(release_date <= "2019-01-01",
         revenue <= 1000000000) |> 
  ggplot(aes(x = revenue)) +
  geom_histogram(bins = 50, color = "black", fill = "slategray1") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 1000000000), labels = scales::comma) +
  scale_y_continuous(limits = c(0, 2000)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Revenue", y = "Frequency",
       title = "Distribution of Movie Revenue (2019-2023)")

# print plots
fig_6 <- revenue_plot_1/revenue_plot_2

# ggsave
ggsave(filename = "figures/fig_6.png", fig_6, width = 6, height = 4)

# creating a boxplot for revenue
fig_5 <- movies_condensed |> 
  na.omit() |> 
  ggplot(aes(x = revenue)) +
  geom_boxplot() +
  theme_minimal() +
  scale_x_continuous(labels = scales::comma) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Revenue", y = "",
       title = "Boxplot of Movie Revenue")

# ggsave
ggsave(filename = "figures/fig_5.png", fig_5, width = 6, height = 4)

## Looking at the variable vote_average ----

# summary statistics for vote_average variable
movies_condensed |> 
  na.omit() |> 
  summarise(mean = mean(vote_average),
            median = median(vote_average),
            min = min(vote_average),
            max = max(vote_average),
            sd = sd(vote_average))

# creating a basic histogram for vote_average
fig_9 <- movies_condensed |>
  na.omit() |> 
  ggplot(aes(x = vote_average)) +
  geom_histogram(binwidth = 0.5, color = "black", fill = "slategray1") +
  labs(x = "Vote Average", y = "Frequency",
       title = "Distribution of Movie Ratings") +
  theme_minimal()

# ggsave
ggsave(filename = "figures/fig_9.png", fig_9, width = 6, height = 4)


## Looking at the variable runtime ----

# summary statistics for runtime
movies_condensed |> 
  na.omit() |> 
  summarise(mean = mean(runtime),
            median = median(runtime),
            min = min(runtime),
            max = max(runtime),
            sd = sd(runtime))

# creating a basic histogram for runtime
fig_8 <- movies_condensed |>
  na.omit() |> 
  ggplot(aes(x = runtime)) +
  geom_histogram(bins = 30, color = "black", fill = "slategray1") +
  labs(x = "Runtime", y = "Frequency",
       title = "Distribution of Movie Runtime (In Minutes)") +
  scale_x_continuous(limits = c(0, 250)) +
  theme_minimal()

# ggsave
ggsave(filename = "figures/fig_8.png", fig_8, width = 6, height = 4)


## Looking at the variable profit ----

# summary statisticis for the variable profit
movies_condensed |> 
  na.omit() |> 
  summarise(mean = mean(profit),
            median = median(profit),
            min = min(profit),
            max = max(profit),
            sd = sd(profit))

# creating a basic histogram for movies from the first five years of this decade (profit)
fig_3 <- movies_condensed |>
  na.omit() |>
  filter(release_date >= "2013-01-01" & release_date <= "2019-01-01") |> 
  ggplot(aes(x = profit)) +
  geom_histogram(bins = 50, color = "black", fill = "slategray1") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 500000000), labels = scales::comma) +
  scale_y_continuous(limits = c(0, 250)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Profit", y = "Count",
       title = "Distribution of Movie Profits (2013-2019)")

# ggsave
ggsave(filename = "figures/fig_3.png", fig_3, width = 6, height = 4)

# creating a basic histogram for movies from the last five years of this decade (profit)
fig_4 <- movies_condensed |>
  na.omit() |> 
  filter(release_date <= "2019-01-01") |> 
  ggplot(aes(x = profit)) +
  geom_histogram(bins = 50, color = "black", fill = "slategray1") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 1000000000), labels = scales::comma) +
  scale_y_continuous(limits = c(0, 1300)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Profit", y = "Count",
       title = "Distribution of Movie Profit (2019-2023)")

## ggsave
ggsave(filename = "figures/fig_4.png", fig_4, width = 6, height = 4)

# creating a boxplot to see outliers (profit)
fig_2 <- movies_condensed |> 
  na.omit() |> 
  ggplot(aes(x = profit)) +
  geom_boxplot(varwidth = TRUE) +
  theme_minimal() +
  scale_x_continuous(labels = scales::comma) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Profit", y = "",
       title = "Boxplot of Movie Profits")

# ggsave
ggsave(filename = "figures/fig_2.png", fig_2, width = 6, height = 4)

## Looking at the variable budget ----

# summary statistics for the variable budget
movies_condensed |> 
  na.omit() |> 
  summarise(mean = mean(budget),
            median = median(budget),
            min = min(budget),
            max = max(budget),
            sd = sd(budget))

# creating a basic histogram for budget
fig_7 <- movies_condensed |>
  na.omit() |> 
  ggplot(aes(x = budget)) +
  geom_histogram(bins = 50, color = "black", fill = "slategray1") +
  theme_minimal() +
  scale_x_continuous(limits = c(0, 300000000), labels = scales::comma) +
  scale_y_continuous(limits = c(0, 1750)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(x = "Budget", y = "Count",
       title = "Distribution of Movie Budget Within the Last Decade")

## ggsave
ggsave(filename = "figures/fig_7.png", fig_7, width = 6, height = 4)


# Extra for the appendices ----
yearly_profit_histograms <- function(data) {
  data |> 
    na.omit() |> 
    filter(between(year(release_date), 2013, 2023)) |> 
    ggplot(aes(x = profit)) +
    geom_histogram(bins = 50, fill = "skyblue", color = "black") +
    facet_wrap(~ year(release_date), scales = "free") +
    scale_x_continuous(labels = scales::comma) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(title = "Histograms of Profit by Year", x = "Profit", y = "Frequency") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# example usage
fig_20 <- yearly_profit_histograms(movies_condensed)

# ggsave
ggsave(filename = "figures/fig_20.png", fig_20, width = 6, height = 4)
