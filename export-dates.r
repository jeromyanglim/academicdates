library(readxl)
source("lib/export-ics.R")
options(stringsAsFactors = FALSE)

events <- as.data.frame(read_excel("data/meta.xls", "year2024"))

export_ics(events$date, events$subject, "output/export2024-2.ics")