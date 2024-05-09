#' CountryPopulation
#'
#' Produce a graph of any country given as a string for the input
#' @param input Any string but should be a country or region
#' @examples
#' CountryPopulation("United States of America")
#' CountryPopulation("Russian Federation")
#' @export
"CountryPopulation"

Country_Population <- function(input){
  World_Population <- read_excel("World_Population.xlsx", sheet = "ESTIMATES",
                                 range = "A17:BZ306")  %>%
    mutate("Country_Name"= `Region, subregion, country or area *`) %>%
    pivot_longer(cols = 8:78, names_to = "Year", values_to = "Population") %>%
    select(Country_Name, Year, Population) %>%
    mutate(
      Year = as.integer(Year),
      Population = as.integer(Population)
    ) %>%
    filter(Country_Name == input)

  if(nrow <= 0){
    stop("Please enter a valid Region, Subregion, Country, or Area.")
  }


  plot <- ggplot(World_Population, aes(x = Year, y = Population)) +
    geom_point() + theme_dark() +
    labs(title = input)

  return(plot)
}
