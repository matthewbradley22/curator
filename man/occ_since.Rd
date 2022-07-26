% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prep_data.R
\name{occ_since}
\alias{occ_since}
\title{retrieve records from gbif, wrapper around occ_search}
\usage{
occ_since(
  startingMonth = 6,
  startingYear = 2021,
  name = NULL,
  taxKey = 2721893,
  genKey = NULL,
  numObs = 1e+06,
  coordinate = TRUE
)
}
\arguments{
\item{startingMonth}{Starting month of starting year for retrieving data}

\item{startingYear}{Starting year for retrieving data}

\item{name}{Scientific name from the GBIF backbone}

\item{taxKey}{Gbif taxon  key}

\item{genKey}{Gbif genus key}

\item{numObs}{How many observations should be pulled from Gbif}

\item{coordinate}{Return only records with lat and lon data}
}
\value{
returns a dataframe with biological data from Gbif
}
\description{
retrieve records from gbif, wrapper around occ_search
}
\examples{
get_records_since_date()
}
