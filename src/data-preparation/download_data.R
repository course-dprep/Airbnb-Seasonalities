urls = c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-09-07/data/calendar.csv.gz",
         "http://data.insideairbnb.com/france/ile-de-france/paris/2022-09-09/data/calendar.csv.gz",
         "http://data.insideairbnb.com/czech-republic/prague/prague/2022-09-16/data/calendar.csv.gz",
         "http://data.insideairbnb.com/portugal/lisbon/lisbon/2022-09-13/data/calendar.csv.gz",
         "http://data.insideairbnb.com/brazil/rj/rio-de-janeiro/2022-09-21/data/calendar.csv.gz",
         "http://data.insideairbnb.com/mexico/df/mexico-city/2022-09-22/data/calendar.csv.gz",
         "http://data.insideairbnb.com/chile/rm/santiago/2022-09-22/data/calendar.csv.gz",
         "http://data.insideairbnb.com/argentina/ciudad-autónoma-de-buenos-aires/buenos-aires/2022-09-22/data/calendar.csv.gz")


for (url in urls) {
  filename = paste0(gsub('[^a-z]', '', url), '.csv') 
  filename = gsub('httpdatainsideairbnbcom', '', filename)
  filename = gsub('datacalendarcsvgz', '', filename)
  download.file(url, destfile = filename) 
}
