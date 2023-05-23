course_content <-
  tibble::tribble(
    ~Day, ~Time, ~Title,
    "July 14", "09:00am-10:30am", "Introduction to GIS",
    "July 14", "10:30am-12:00pm", "Vector Data",
    "July 14", "12:00pm-01:00pm", "Lunch Break",
    "July 14", "01:00pm-02:30pm", "Mapping",
    "July 14", "02:30pm-04:00pm", "Raster Data",
    "July 15", "09:00am-10:00am", "Advanced Data Import & Processing",
    "July 15", "10:00am-11:00am", "Applied Data Wrangling & Linking",
    "July 15", "11:00am-12:00pm", "Investigating Spatial Autocorrelation",
    "July 15", "12:00pm-01:00pm", "Lunch Break",
    "July 15", "01:00pm-02:45pm", "Spatial Econometrics & Outlook"
  ) %>%
  knitr::kable() %>%
  kableExtra::kable_styling() %>%
  kableExtra::column_spec(1, color = "gray") %>%
  kableExtra::column_spec(2, color = "gray") %>%
  kableExtra::column_spec(3, bold = TRUE) %>%
  kableExtra::row_spec(3, color = "gray") %>%
  kableExtra::row_spec(9, color = "gray") %>%
  kableExtra::row_spec(5, extra_css = "border-bottom: 1px solid")
