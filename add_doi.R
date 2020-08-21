####add_doi.R
## In this file, we use the library fulltext to read paper title and search for their 
## DOIs


library("dplyr")
library("fulltext")

setwd("C:/Users/messanks/OneDrive/Projects/Rotations/DIR_RTB_GTS/Analysis/COVID19")

#################################
#### Read Data
data <- read.csv("therapeutics_evidence_angiotensin.csv", header = TRUE)

#### add empty doi column to the data
data[,"doi"] <- NA

for(ii in 1:dim(data)[1]){
  
  res <- ft_search(query = data$Title[ii], from = "crossref")
  res <- ft_links(res)
  data$doi[ii] <- res$crossref$ids[1] 
  
}


#### Write to a file
#write.csv(data, file = "therapeutics_evidence_angiotensin2.csv", col.names = TRUE)

# res1 <- ft_search(query = "Covid-19-associated coagulopathy (CoAC): 
#                   thrombin burst and insufficient fibrinolysis leading 
#                   to bad outcome.", from="crossref")
# res1 <- ft_links(res1)
# res1$crossref$ids[1] 