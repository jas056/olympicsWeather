#' get_weather_forecast
#' @description
#' Cette fonction renvoie les previsions meteorologiques selon l'adresse ou les coordonnees fournies.
#' Nous avons des informations sur la temperature ressentie et celle attendue, des chances de pluie et de la quantite de pluie observee.
#' Si l'argument est un vecteur, la fonction fait appel a la fonction get_forecast.numeric.
#' Et si c'est une adresse, elle fait appel a la fonction get_forecast.character.
#' Sinon, elle ne renvoie rien si l'argument ne correspond a aucun des deux types.
#'
#'
#' @param arg Soit un vecteur numerique de taille 2 : c(x,y), soit une adresse textuelle
#'
#' @export
#' @return un tibble sous format JSON
#' @examples
#' get_weather_forecast(c(48.85,2.35))
#' get_weather_forecast("Paris, France")

get_weather_forecast <- function(arg) {
  if (is.numeric(arg) & length(arg) == 2) {
    previsions <- get_forecast.numeric(arg)
  }
  else if (is.character(arg) & length(arg) == 1) {
    previsions <- get_forecast.character(arg)
  }
  else {
    stop("L'argument doit etre soit un vecteur numerique de taille 2 (coordonnees) soit une chaine de caracteres de taille 1 (adresse).")
  }
  # Convertir le résultat en JSON
  json_forecast <- jsonlite::toJSON(previsions)

  # Écrire le JSON dans un fichier
  write(json_forecast, file = "previsions.json")
  return(json_forecast)
}

