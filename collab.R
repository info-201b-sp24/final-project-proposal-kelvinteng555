# Josh Lee server
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plotly)
function(input, output) {
  output$plot <- renderPlotly({
    top5 <- dataset %>%
      top_n(5, Cns_TotHH) %>%
      arrange(TaxRate_SS)
    zipCode <- top5 %>%
      pull(GEOID10)
    chart2 <- ggplot(dataset)+
      geom_smooth(mapping = aes(
        x = CountBars, 
        y = if(input$checkbox) Mjoint_SS else Cns_UPSS,
        text = paste("# Bars:", CountBars)
        ))+
      labs(
        title = if (input$checkbox) "Number of Gay Bars vs. Married Same-sex Couples" else "Number of Gay Bars vs Unmarried Same-Sex Couples",
        x = "Number of Gay Bars",
        y = if (input$checkbox) "Married SS Couples" else "Unmarried SS Couples"
      )
    ggplotly(chart2, tooltip = ("text"))
  })
}
# Josh Lee UI
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plotly)
ui <- fluidPage(
  h1("The correlation between gay bars and same-sex couples", align = "center"),
  checkboxInput(inputId = "checkbox", label = "Married", value = TRUE),
  hr(),
  fluidRow(column(12, plotlyOutput("plot")))
  
)                        
