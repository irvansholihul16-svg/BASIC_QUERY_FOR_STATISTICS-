getwd()
install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)
library(dplyr)

con <- dbConnect(
  RMySQL::MySQL(),
  user = "root",
  password = "",          
  dbname = "db_scrapping",
  host = "localhost",
  port = 3307
  )
  print("Koneksi berhasil")

hasil_scrap<-dbGetQuery(con,"select*from buku")
head(hasil_scrap)
typeof(hasil_scrap)
names(hasil_scrap)


analisis_rating <- hasil_scrap %>%group_by(Rating) %>%
                    summarise(Jumlah_Buku = n())%>%
                    arrange(desc(Jumlah_Buku))
print(analisis_rating)

setwd("D:/R Directory/worksheet")
getwd()


