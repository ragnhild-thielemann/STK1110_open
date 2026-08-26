
library(tidyverse)
library(tidytext)
speek = read.csv("speech1516.csv",header = TRUE)
speek_bokmaal = speek |> filter(language == "nob") |> unnest_tokens(word,text)

view(speek_bokmaal)