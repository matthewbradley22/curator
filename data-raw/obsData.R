## code to prepare `obsData` dataset goes here

usethis::use_data(obsData, overwrite = TRUE)

dat = get_records_since_date(numObs = 1000)
obsData = CoordinateCleaner::clean_coordinates(x = dat,
                                               lon = "decimalLongitude",
                                               lat = "decimalLatitude",
                                               countries = "countryCode",
                                               species = "species")

names = c("species", "scientificName", "decimalLatitude", "decimalLongitude",
          "countryCode", ".val", ".equ", ".zer",".cap", ".cen" ,   ".sea", ".otl" ,".gbf", ".inst", ".summary" )

obsData = obsData[colnames(obsData) %in% names]
