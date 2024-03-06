#' get_gps_coordinate
#' @description
#' Cette fonction consiste egalement a indiquer les coordonnees GPS d'une adresse.
#' Elle est interne car elle fait appel a une autre fonction (address_to_gps).
#' x renvoie la longitude et y la latitude
#'
#' @param address caractere de taille 1
#' @export
#' @return un vecteur avec les coordonnées x et y.
#' @examples
#' get_gps_coordinate("Lorient, France")

get_gps_coordinate <- function(address) {
  # Definition de la fonction interne pour obtenir les coordonnees GPS
  resultat <- address_to_gps(address)
  coordinates <- c(x=resultat$lat,y=resultat$long)
  return(coordinates)
}

get_gps_coordinate("Lorient, France")
