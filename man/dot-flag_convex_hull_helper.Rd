% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convex_hull_flags.R
\name{.flag_convex_hull_helper}
\alias{.flag_convex_hull_helper}
\title{Helper function to create a convex hull of a species on a specific continent.
Observation is flagged if it is outside convex hull}
\usage{
.flag_convex_hull_helper(
  data,
  ECD,
  ECDContinent,
  datContinent,
  ECDspecies,
  datSpecies,
  ECDlon,
  ECDlat,
  datLon,
  datLat
)
}
\arguments{
\item{data}{dataset of observations}

\item{ECD}{Expert curated dataset}

\item{ECDContinent}{Continent column name in ECD}

\item{datContinent}{Continent column name in new dataset}

\item{ECDspecies}{Species column name in ECD}

\item{datSpecies}{Species column name in new dataset}

\item{ECDlon}{Longitude column name in ECD}

\item{ECDlat}{Latitude column name in ECD}

\item{datLon}{Longitude column name in new dataset}

\item{datLat}{Latitude column name in new dataset}
}
\value{
dataset of the same class passed to it. New column of convex hull flags.
}
\description{
Helper function to create a convex hull of a species on a specific continent.
Observation is flagged if it is outside convex hull
}
