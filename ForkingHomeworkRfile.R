library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)

# Data Table
write_csv(diamonds, 'diamonds.csv')
diamonds <- fread('diamonds.csv')
# diamonds[, .(carat, cut, price)]
ndiamond <- diamonds[(price > 7000 & price < 10000 & cut == "Premium") , .(carat, cut, price)][order(-carat)]
head(ndiamond, 20)
# ndiamond[1:20, ]
