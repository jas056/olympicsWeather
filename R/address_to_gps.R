#' address_to_gps
#' @description
#' Cette fonction consiste à convertir une adresse textuelle en coordonnées gps
#'
#' @param address caractère de taille 1
#' @export
#' @return un tibble indiquant la latitude et la longitude de l'adresse indiquée
#' @examples
#' #exemple code
#' address_to_gps("Lorient, France")

address_to_gps <- function(address) {
  df <- data.frame(address)
  # Trouver les coordonnées GPS à partir de l'adresse
  resultat <- tidygeocoder::geocode(df, address)
  return(resultat)
}



