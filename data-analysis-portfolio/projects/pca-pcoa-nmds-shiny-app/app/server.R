
library(shiny)
library(ggplot2)
library(vegan)
library(dplyr)

server <- function(input, output, session) {

  data_input <- reactive({
    req(input$file1)
    df <- read.csv(input$file1$datapath, row.names=1)
    df
  })

  output$color_ui <- renderUI({
    df <- data_input()
    selectInput("color_var", "Color by:", choices = names(df), selected = names(df)[1])
  })

  output$shape_ui <- renderUI({
    df <- data_input()
    selectInput("shape_var", "Shape by:", choices = names(df), selected = names(df)[1])
  })

  output$size_ui <- renderUI({
    df <- data_input()
    selectInput("size_var", "Size by:", choices = names(df), selected = names(df)[1])
  })

  output$plot <- renderPlot({
    df <- data_input()
    numeric_cols <- sapply(df, is.numeric)
    df_num <- df[, numeric_cols]
    df_scaled <- if(input$scale) scale(df_num) else df_num
    scores <- NULL
    if(input$analysis == "PCA"){
      pca_res <- prcomp(df_scaled, center = TRUE, scale. = FALSE)
      scores <- as.data.frame(pca_res$x[, 1:2])
      colnames(scores) <- c("Dim1", "Dim2")
    } else if(input$analysis == "PCoA"){
      dist_matrix <- vegdist(df_scaled)
      pcoa_res <- cmdscale(dist_matrix, eig = TRUE, k = 2)
      scores <- as.data.frame(pcoa_res$points)
      colnames(scores) <- c("Dim1", "Dim2")
    } else if(input$analysis == "NMDS"){
      nmds_res <- metaMDS(df_scaled, distance = "bray", k = 2, trymax = 50)
      scores <- as.data.frame(scores(nmds_res))
      colnames(scores) <- c("Dim1", "Dim2")
    }
    metadata <- df[, !numeric_cols, drop=FALSE]
    plot_df <- cbind(scores, metadata)
    ggplot(plot_df, aes_string(x = "Dim1", y = "Dim2",
                               color = input$color_var,
                               shape = input$shape_var,
                               size = input$size_var)) +
      geom_point(alpha = 0.7) +
      theme_minimal() +
      labs(title = paste(input$analysis, "Plot"))
  })

  output$summary <- renderTable({
    df <- data_input()
    summary(df)
  })
}
