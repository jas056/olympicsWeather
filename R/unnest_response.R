#' unnest_response
#' @description
#' Cette fonction permet de retourner un tableau ayant les listes de la colonne hourly en colonnes avec comme entrée les coordonnées de la fonction précédente
#'
#' @param resp a tibble
#' @export
#' @return Un tableau des 5 listes de la colonne hourly
#' @examples
#' resp <- perform_request(48.85,2.35)
#' resp |>  unnest_response() -> y
#' plot(y$temperature_celsius, type="l")

unnest_response <- function(resp) {
  tibble::tibble(
    date_heure = unlist(resp$hourly[1][[1]]),
    temperature_celsius = unlist(resp$hourly[2][[1]]),
    temperature_ressentie = unlist(resp$hourly[3][[1]]),
    temperature_proba = unlist(resp$hourly[4][[1]]),
    precipitation = unlist(resp$hourly[5][[1]])
  )
}


