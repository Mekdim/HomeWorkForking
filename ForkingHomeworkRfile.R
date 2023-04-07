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

ndiamond <- diamonds[cut == "Premium", (price > 7000 & price < 10000) , .(carat, cut, price)][order(-carat)]
head(ndiamond, 20)
