% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ds_upsert.R
\name{ds_upsert}
\alias{ds_upsert}
\title{Upsert data to a datastore}
\usage{
ds_upsert(resource_id = NULL, force = FALSE, method = c("upsert",
  "insert", "update"), records = NULL, key = get_default_key(),
  url = get_default_url(), as = "list", ...)
}
\arguments{
\item{resource_id}{(string) Resource id that the data is going to be stored
against.}

\item{force}{(logical) Set to \code{TRUE} to edit a read-only resource.
Default: FALSE}

\item{method}{(string) Set to \code{insert}, \code{upsert} or \code{update}
Default: 'upsert'}

\item{records}{(list) The data, eg: \code{[{"dob": "2005", "some_stuff":
["a", "b"]}]} (optional)}

\item{key}{A privileged CKAN API key, Default: your key set with \code{\link{ckanr_setup}}}

\item{url}{Base url to use. Default: \url{http://data.techno-science.ca}. See
also \code{\link{ckanr_setup}} and \code{\link{get_default_url}}.}

\item{as}{(character) One of list (default), table, or json. Parsing with table option
uses \code{jsonlite::fromJSON(..., simplifyDataFrame = TRUE)}, which attempts to parse
data to data.frame's when possible, so the result can vary from a vector, list or
data.frame. (required)}

\item{...}{Curl args passed on to \code{\link[httr]{POST}} (optional)}
}
\description{
Upsert data to a datastore
}
\references{
\url{http://bit.ly/1G9cnBl}
}
