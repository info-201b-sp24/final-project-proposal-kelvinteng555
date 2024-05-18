library(ggplot2)
library(dplyr)
library(readr)
dataset <- read_csv("Downloads/data.csv")
top5 <- dataset %>%
    top_n(5, TaxRate_SS) %>%
    arrange(TaxRate_SS)
zipCode <- top5 %>%
    pull(GEOID10)
ggplot(top5)+
  ggplot(top5)+
    geom_col(mapping = aes(x = zipCode, y = TaxRate_SS))+
    labs(
         title = "Zipcodes versus Highest Rates of SS Couples",
         x = "Zipcodes",
         y = "Rate of SS Married Couples"
         )
