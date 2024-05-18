library(ggplot2)
library(dplyr)
library(readr)
dataset <- read_csv("Downloads/data.csv")
top5 <- dataset %>%
    top_n(5, Cns_TotHH) %>%
    arrange(TaxRate_SS)
zipCode <- top5 %>%
    pull(GEOID10)
ggplot(top5)+
  geom_col(mapping = aes(x = zipCode, y = TaxRate_SS))+
  labs(
    title = "Most Populated Zipcodes versus Rate of Same-Sex Married Couples",
    x = "Most Populated Zipcodes",
    y = "Rate of Same-Sex Married Couples"
    )

