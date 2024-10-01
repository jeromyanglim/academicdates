export_ics <- function(event_dates, event_subjects, ics_file = "output/test.ics") {
    # https://chatgpt.com/c/66f9f5fe-9874-8013-b0ca-f4b362e3b7a7
    
    # Clear the file by writing an empty string
    if (file.exists(ics_file)) {  # File already exists, stop with an error message
        stop("File already exists")
    }
    ics_file <- file(ics_file, open = "w")
    
    unique_code <- "exportedcalendar"  # Unique code to identify events
    
    # Write the ICS file header
    writeLines("BEGIN:VCALENDAR", ics_file)
    writeLines("VERSION:2.0", ics_file)
    
    # Loop through the events and write each one as a VEVENT
    for (i in 1:length(event_dates)) {
        writeLines("BEGIN:VEVENT", ics_file)
    
      # Format the date to YYYYMMDD
        event_date <- format(as.Date(event_dates[i]), "%Y%m%d")
        # Calculate the end date, which should be the next day for all-day events
        event_end_date <- as.Date(event_date, "%Y%m%d") + 1  # End date is one day after the start
        event_end_date <- format(event_end_date, "%Y%m%d")   # Format end date in YYYYMMDD
        
        writeLines(paste0("DTSTART;VALUE=DATE:", event_dates[i]), ics_file)
        writeLines(paste0("DTEND;VALUE=DATE:", event_end_date), ics_file)  # End date (exclusive)
        writeLines(paste0("SUMMARY:", event_subjects[i]), ics_file)
        writeLines("STATUS:CONFIRMED", ics_file)
        writeLines("TRANSP:TRANSPARENT", ics_file)  # Show as free
        writeLines("X-MICROSOFT-CDO-ALLDAYEVENT:TRUE", ics_file)  # All day event
        # **Add the BusyStatus to ensure it shows as Free in Outlook**
        writeLines("X-MICROSOFT-CDO-BUSYSTATUS:FREE", ics_file)  # Ensures it shows as Free in Outlook

         # Add a unique code to the event's body (DESCRIPTION)
        writeLines(paste0("DESCRIPTION:", unique_code), ics_file)
        
        writeLines("END:VEVENT", ics_file)
    }
    
    # Write the ICS file footer
    writeLines("END:VCALENDAR", ics_file)
    
    # Close the file
    close(ics_file)
}    