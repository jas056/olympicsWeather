#' get_forecast.character
#'
#' @param address caractere de taille 1
#'
#' @description
#' Obtenir les previsions meteorologiques a partir d'une adresse textuelle.
#' Faire appel aux fonctions address_to_gps et get_forecast.numeric
#' @export
#' @return un tibble de 5 colonnes et de 168 observations
#'
#' @examples
#' get_forecast.character("Lorient, France")

get_forecast.character <- function(address) {

  if (!is.character(address) || length(address) != 1) {
    stop("L'argument address doit etre un caractere de taille 1.")
  }

  resultat <- address_to_gps(address)
  coordinates <- c(x=resultat$lat,y=resultat$long)

  tibble_resultat <- get_forecast.numeric(coordinates)

  return(tibble_resultat)
}

