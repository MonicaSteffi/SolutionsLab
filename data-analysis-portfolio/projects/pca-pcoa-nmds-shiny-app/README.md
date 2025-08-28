# PCA, PCoA & NMDS Shiny App

## Overview
Interactive Shiny app to visualize multivariate data using PCA, PCoA, and NMDS.

## Features
- Upload CSV dataset
- Choose analysis: PCA, PCoA, NMDS
- Select variables for color, shape, size
- Interactive plots and summary statistics

## Usage
1. Clone the repository.
2. Open `ui.R` and `server.R` in RStudio.
3. Run `shinyApp(ui, server)` or click "Run App".
4. Upload your CSV dataset to visualize.

## Example Dataset
- `data/example_data.csv` included for testing.

## Tools & Packages
- R: `shiny`, `ggplot2`, `vegan`, `dplyr`
