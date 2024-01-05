## Overview

This subdirectory contains the r-scripts that is used to code the EDA. It contains 6 different r-scripts, each having to do with a part of the EDA.

## R-scripts

The first r-script is for data collection. This is used to save `movies_condensed` and `movies_condensed_codebook`. It is also used to read in the data to the environment.

The second r-script is used for data cleaning. This is to ultimately analyze the  `movies_data`, and see which variables I wanted to manipulate and change. It is ultimately the code used to create `movies_condensed` as well as evaluate missingness.

The third r-script is used for the univariate analysis used for the EDA. It contains the code for plots that will be used to visualize a single variable that is related to `profit`. These plots are saved and displayed on the qmd document later.

The fourth r-script is used for the multivariate analysis used for the EDA. It contains the code for plots that will be used to visualize multiple variables and its relationship with the variable `profit`. These plots are saved and displayed on the qmd document later.

The fifth r-script is used for the figures that are displayed throughout the EDA. It contains code for data tables that measure correlation coefficients, summary statistics, and missingness in relation to the variable `profit` and all the other variables that were analyzed through the EDA.

The last r-script is used to write the code for `movies_condensed_codebook`. This is used to learn more about the variables in the `movies_condensed` dataset.


## References

[TMDB Movies Dataset](https://www.kaggle.com/datasets/asaniczka/tmdb-movies-dataset-2023-930k-movies/data)