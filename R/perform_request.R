#' perform_request
#' @description
#' Cette fonction permet d'obtenir toutes les informations de l'API des coordonnées fournies sous forme de tableau

#' @param lat latitude (numeric)
#' @param lon longitude (numeric)
#' @export
#' @return a tibble with 5 rows
#' @examples
#' perform_request(48.85,2.35)

perform_request <- function(lat, lon){
  url <-"https://api.open-meteo.com/v1/forecast"
  response_table <-
    httr2::request(url) |>
    httr2::req_url_query(latitude=lat,longitude=lon,
                         hourly=c("temperature_2m",
                                  "apparent_temperature",
                                  "precipitation_probability",
                                  "precipitation"),
                         .multi ="comma") |>
    httr2::req_perform() |>
    httr2::resp_body_json()|>
    tibble::as_tibble()
  return(response_table)
}
