course_content <-
  tibble::tribble(
    ~Day, ~Time, ~Title,
    "June 06", "10:00-11:30", "Introduction to GIS",
    "June 06", "11:45-13:00", "Vector Data",
    "June 06", "13:00-14:00", "Fingerfood@GESIS",
    "June 06", "14:00-15:30", "Mapping",
    "June 06", "15:45-17:00", "Raster Data",
    "June 07", "09:00-10:30", "Advanced Data Import & Processing",
    "June 07", "10:45-12:00", "Applied Data Wrangling & Linking",
    "June 07", "12:00-13:00", "Lunch Break",
    "June 07", "13:00-14:30", "Investigating Spatial Autocorrelation",
    "June 07", "14:45-16:00", "Spatial Econometrics & Outlook"
  ) %>%
  knitr::kable() %>%
  kableExtra::kable_styling() %>%
  kableExtra::column_spec(1, color = "gray") %>%
  kableExtra::column_spec(2, color = "gray") %>%
  kableExtra::column_spec(3, bold = TRUE) %>%
  kableExtra::row_spec(3, color = "gray") %>%
  kableExtra::row_spec(8, color = "gray") %>%
  kableExtra::row_spec(5, extra_css = "border-bottom: 1px solid")
