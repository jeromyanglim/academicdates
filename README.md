# Generate my weekly calendar for Outlook

Every year I need to add a marker to my Calendar in Outlook to indicate the academic week for each of the 52 weeks in a year.
My standard approach is to have an all day event on Monday with no reminder and marked as free. A typical indicator might be "T1 WEEK 1" for Trimester 1 Week 1 or "T1 BREAK" for the Trimester 1 Inter-trimester break.
I need to do this to plan my teaching commitments and co-ordinate with other staff.
Traditionally, this was a painful process of manually entering in each calendar entry.

This little bit of code is designed to make this process more efficient.

The function in the `lib` folder works by taking a data.frame of dates and calendar titles/subjects from a spreadsheet. It generates an `ics` file that can be imported into Outlook.

I used ChatGPT to customise the code for generating the ics file. In particular, it involved a bit of iterating with ChatGPT to get the calendar entry in the right format (e.g., showing as free and without an alarm).

You can see an example of the data.frame in the `data` folder that could be adapted.

It also includes a unique text string `exportedcalendar` that is placed in the body of each calendar entry. This is useful in case the export goes wrong. It should be easy to search for this string in Outlook and delete the entries. 