% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/google_map_layer_heatmap.R
\name{update_heatmap}
\alias{update_heatmap}
\title{update heatmap}
\usage{
update_heatmap(map, data, lat = NULL, lon = NULL, weight = NULL,
  option_gradient = NULL, option_dissipating = FALSE,
  option_radius = 0.01, option_opacity = 0.6, layer_id = NULL,
  update_map_view = TRUE, digits = 4, legend = F,
  legend_options = NULL)
}
\arguments{
\item{map}{a googleway map object created from \code{google_map()}}

\item{data}{data frame containing the data to use in the layer. If Null, the
data passed into \code{google_map()} will be used.}

\item{lat}{string specifying the column of \code{data} containing the 'latitude'
coordinates. If left NULL, a best-guess will be made}

\item{lon}{string specifying the column of \code{data} containing the 'longitude'
coordinates. If left NULL, a best-guess will be made}

\item{weight}{string specifying the column of \code{data} containing the 'weight'
associated with each point. If NULL, each point will get a weight of 1.}

\item{option_gradient}{vector of colours to use as the gradient colours. see Details}

\item{option_dissipating}{logical Specifies whether heatmaps dissipate on zoom.
When dissipating is FALSE the radius of influence increases with zoom level to
ensure that the color intensity is preserved at any given geographic location.
When set to TRUE you will likely need a greater \code{option_radius} value.
Defaults to FALSE.}

\item{option_radius}{numeric. The radius of influence for each data point, in pixels.
Defaults to 0.01}

\item{option_opacity}{The opacity of the heatmap, expressed as a number between
0 and 1. Defaults to 0.6.}

\item{layer_id}{single value specifying an id for the layer. Use this value to
distinguish between shape layers for when using any \code{update_} function, and
for separating legends.}

\item{update_map_view}{logical specifying if the map should re-centre according to
the shapes}

\item{digits}{integer. Use this parameter to specify how many digits (decimal places)
should be used for the latitude / longitude coordinates.}

\item{legend}{either a logical indiciating if the legend(s) should be displayed, or
a named list indicating which colour attributes should be included in the legend.}

\item{legend_options}{A list of options for controlling the legend.}
}
\description{
updates a heatmap layer
}
\details{
The \code{option_gradient} is only used to craete the legend, and not to change
the colours of the heat layer. If you are not displaying
a legend this argument is not needed. If you are displaying a legend, you should
provide the same gardient as in the \code{add_heatmap} call.
}
\examples{
\dontrun{

map_key <- 'your_api_key'

set.seed(20170417)
df <- tram_route
df$weight <- sample(1:10, size = nrow(df), replace = T)

google_map(key = map_key, data = df) \%>\%
 add_heatmap(lat = "shape_pt_lat", lon = "shape_pt_lon", weight = "weight",
              option_radius = 0.001)

## update by adding the same data again to double the number of points at each location
df_update <- df
google_map(key = map_key, data = df) \%>\%
 add_heatmap(lat = "shape_pt_lat", lon = "shape_pt_lon", weight = "weight",
              option_radius = 0.001) \%>\%
 update_heatmap(df_update, lat = "shape_pt_lat", lon = "shape_pt_lon")

}

}
