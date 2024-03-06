#' get_forecast.numeric
#' @description
#' Cette fonction consiste a donner les previsions meteorologiques a partir des coordonnees fournies
#'
#' @param xy un vecteur numerique de taille 2
#' @export
#' @return un tibble des previsions meteorologiques
#' @examples
#' xy <- c(47.7,-3.37)
#' previsions <- get_forecast.numeric(xy)
#' head(previsions)


get_forecast.numeric <- function(xy) {
  #Verification si xy est un vecteur numerique de taille 2
  if (!is.numeric(xy) || length(xy) != 2) {
    stop("L'argument xy doit etre un vecteur numerique de taille 2.")
  }

  #Appel de la fonction perform_request pour faire appel à l'API meteo
  resultat <- perform_request(lat = xy[1], lon = xy[2])

  #Appel de la fonction unnest_response pour mettre dans un tibble
  tibble_resultat <- unnest_response(resultat)

  return(tibble_resultat)
}
