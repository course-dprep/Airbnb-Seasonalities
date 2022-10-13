urls = c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/data/calendar.csv.gz",
         "http://data.insideairbnb.com/austria/vienna/vienna/2022-09-11/data/calendar.csv.gz",
         "http://data.insideairbnb.com/czech-republic/prague/prague/2022-09-16/data/calendar.csv.gz",
         "http://data.insideairbnb.com/portugal/lisbon/lisbon/2022-09-13/data/calendar.csv.gz",
         "http://data.insideairbnb.com/australia/vic/melbourne/2022-09-09/data/calendar.csv.gz",
         "http://data.insideairbnb.com/australia/nsw/northern-rivers/2022-09-14/data/calendar.csv.gz",
         "http://data.insideairbnb.com/australia/nsw/sydney/2022-09-09/data/calendar.csv.gz",
         "http://data.insideairbnb.com/australia/wa/western-australia/2022-09-20/data/calendar.csv.gz")


for (url in urls) {
  filename = paste0(gsub('[^a-z]', '', url), '.csv') 
  filename = gsub('httpdatainsideairbnbcom', '', filename)
  filename = gsub('datacalendarcsvgz', '', filename)
  download.file(url, destfile = filename) 
}
