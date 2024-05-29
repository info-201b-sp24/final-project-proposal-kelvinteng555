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
# Both of these graphs showcase the correlation between the number of gay bars in a particular zipcode and the number of 
# (un)married same-sex couples in that same zipcode. Both graphs indicate a direct relationship between the two variables, which could be for
# a variety of reasons. The most obvious reason to us is that these couples formed in the first place through the bars as an avenue. Having more
# ways to meet potential partners in an area is sure to increase the number of couples. Another potential reason is that a zipcode with more gay
# bars is more likely to be a safe area free from prejudice and discrimination. Homophobia is unfortunately rampant in many areas of the US, and
# so areas with access to queer communities attracts potential couples to move to these areas. 
