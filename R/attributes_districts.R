library(dplyr)

corona_districts <-
  readr::read_csv("./data/RKI_Corona_Landkreise.csv") %>%
  dplyr::transmute(
    district_id = RS,
    population = EWZ,
    death_rate,
    death7_lk
  )

afd_voteshare_2021 <-
  readr::read_csv2("./data/btw2021kreis.csv", skip = 5) %>%
  dplyr::transmute(
    district_id = `...2`,
    afd_voteshare_2021 = (`Zweitstimmen...57` / `Zweitstimmen...54`) * 100
  )



attributes_districts <-
  dplyr::left_join(corona_districts, afd_voteshare_2021, by = "district_id")

readr::write_csv(attributes_districts, "./data/attributes_districts.csv")
