
library(shiny)

ui <- fluidPage(
  titlePanel("Multivariate Analysis: PCA, PCoA, NMDS"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Upload CSV Dataset", accept = ".csv"),
      selectInput("analysis", "Select Analysis",
                  choices = c("PCA", "PCoA", "NMDS")),
      checkboxInput("scale", "Scale Data", TRUE),
      uiOutput("color_ui"),
      uiOutput("shape_ui"),
      uiOutput("size_ui")
    ),
    mainPanel(
      plotOutput("plot"),
      tableOutput("summary")
    )
  )
)
