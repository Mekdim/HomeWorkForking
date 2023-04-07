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

# Using data table

write_csv(diamonds, 'diamonds.csv') # Write the 'diamonds' data to CSV
diamonds <- fread('diamonds.csv') # Read it in for data table
# diamonds[, .(carat, cut, price)] 
ndiamond <- diamonds[cut == "Premium", (price > 7000 & price < 10000) , .(carat, cut, price)][order(-carat)]
head(ndiamond, 20)
# ndiamond[1:20, ] # This too should work as above
