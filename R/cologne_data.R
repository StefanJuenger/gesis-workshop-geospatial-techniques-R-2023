corona_cologne <-
  glue::glue(
    "https://geoportal.stadt-koeln.de/arcgis/rest/services/\\
    politik_und_verwaltung/covid_stadtteile/MapServer/1/query?where=id+is+not\\
    +null&text=&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&\\
    inSR=&spatialRel=esriSpatialRelIntersects&distance=&units=esriSRUnit_Foot&\\
    relationParam=&outFields=*&returnGeometry=true&returnTrueCurves=false&\\
    maxAllowableOffset=&geometryPrecision=&outSR=4326&havingClause=&returnIds\\
    Only=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics\\
    =&outStatistics=&returnZ=false&returnM=false&gdbVersion=&historicMoment=&\\
    returnDistinctValues=false&resultOffset=&resultRecordCount=&returnExtent\\
    Only=false&datumTransformation=&parameterValues=&rangeValues=&quantization\\
    Parameters=&featureEncoding=esriDefault&f=json") %>%
  sf::read_sf() %>%
  sf::st_transform() %>%
  sf::st_make_valid()

sf::st_write(corona_cologne, "./data/corona_cologne.shp", delete_layer = TRUE)

cologne_bbox <-
  osmdata::getbb("Köln", format_out = "sf_polygon") %>%
  sf::st_transform(3035)

immigrants_cologne <-
  z11::z11_get_100m_attribute(STAATSANGE_KURZ_2) %>%
  terra::crop(cologne_bbox)

germans_cologne <-
  z11::z11_get_100m_attribute(STAATSANGE_KURZ_1) %>%
  terra::crop(cologne_bbox)


inhabitants_cologne <-
  z11::z11_get_100m_attribute(Einwohner) %>%
  terra::crop(cologne_bbox)

terra::writeRaster(
  immigrants_cologne,
  "./data/immigrants_cologne.tiff",
  overwrite = TRUE
)

terra::writeRaster(
  germans_cologne,
  "./data/germans_cologne.tiff",
  overwrite = TRUE
)

terra::writeRaster(
  inhabitants_cologne,
  "./data/inhabitants_cologne.tiff",
  overwrite = TRUE
)