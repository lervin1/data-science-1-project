### Multivariate analysis ----

## color palette for graphs

color_palette <- c("slategray1", "darkslategray4")

## Functions ----

# creating a function that makes a scatterplot for profit vs. given variable
scatter <- function(data, var1, var2) {
  
  var1 <- enquo(var1)
  var2 <- enquo(var2)
  
  label <- rlang::englue("Correlation Between {str_replace_all(str_to_title(rlang::quo_name(var2)), '_', ' ')} and {str_replace_all(str_to_title(rlang::quo_name(var1)), '_', ' ')}\n Within the Last Decade")
  
  data |> 
    na.omit() |> 
    ggplot(mapping = aes(x = {{var1}}, y = {{var2}}, color = english)) +
    geom_point(alpha = 0.5) +
    geom_smooth(aes(group = 1), method = lm, se = FALSE) +
    scale_y_continuous(labels = scales::comma) +
    scale_x_continuous(labels = scales::comma) +
    theme_minimal() +
    scale_color_manual(values = color_palette) +
    labs(
      title = label,
      x = str_replace_all(str_to_title(rlang::quo_name(var1)), '_', ' '),
      y = str_replace_all(str_to_title(rlang::quo_name(var2)), '_', ' '),
      color = "English"
    )
}

## Print scatterplots ----

# print scatterplot for revenue and profit
fig_11 <- scatter(movies_condensed, revenue, profit)

# ggsave
ggsave(filename = "figures/fig_11.png", fig_11, width = 6, height = 4)

# print scatterplot for budget and profit
fig_12 <- scatter(movies_condensed, budget, profit)

# ggsave
ggsave(filename = "figures/fig_12.png", fig_12, width = 6, height = 4)

# print scatterplot for runtime and profit
fig_13 <- scatter(movies_condensed, runtime, profit)

# ggsave
ggsave(filename = "figures/fig_13.png", fig_13, width = 6, height = 4)

# print scatterplot for vote_average and profit
fig_14 <- scatter(movies_condensed, vote_average, profit)

# ggsave
ggsave(filename = "figures/fig_14.png", fig_14, width = 6, height = 4)

