% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/google_keys.R
\name{set_key}
\alias{set_key}
\title{Set Key}
\usage{
set_key(key, api = c("default", "map", "directions", "distance",
  "elevation", "geocode", "places", "find_place", "place_autocomplete",
  "places_details", "roads", "streetview", "timezone"))
}
\arguments{
\item{key}{Google API key}

\item{api}{The api for which the key applies. If NULL, the \code{api_key} is
assumed to apply to all APIs}
}
\description{
Sets an API key so it's available for all API calls. See details
}
\details{
Use \code{set_key} to make API keys available for all the \code{google_}
functions, so you don't need to specify the \code{key} parameter within those
functions (for example, see \link{google_directions}).

The \code{api} argument is useful if you use a different API key to access
different APIs. If you just use one API key to access all the APIs,
there is no need to specify the \code{api} parameter, the default value \code{api_key}
will be used.
}
\examples{

## not specifying 'api' will add the key to the 'api_key' list element
set_key(key = "xxx_your_api_key_xxx")

## api key for directions
set_key(key = "xxx_your_api_key_xxx", api = "directions")

## api key for maps
set_key(key = "xxx_your_api_key_xxx", api = "map")


}
