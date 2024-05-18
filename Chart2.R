library(ggplot2)
library(dplyr)
library(readr)
dataset <- read_csv("Downloads/data.csv")
top5 <- dataset %>%
    top_n(5, Cns_TotHH) %>%
    arrange(TaxRate_SS)
zipCode <- top5 %>%
    pull(GEOID10)
ggplot(dataset)+
    geom_smooth(mapping = aes(x = CountBars, y = Cns_UPSS))+
    labs(
         title = "Number of Gay Bars vs. Unmarried Same-sex Couples",
         x = "Number of Gay Bars",
         y = "Unmarried SS Couples"
         )
