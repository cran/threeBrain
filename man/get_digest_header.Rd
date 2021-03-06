% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{get_digest_header}
\alias{get_digest_header}
\title{Function to read digest header}
\usage{
get_digest_header(file, key, if_error = NULL, .list = NULL)
}
\arguments{
\item{file}{file path to a `JSON` file}

\item{key}{character, key to extract}

\item{if_error}{value to return if key not found or read error occurs}

\item{.list}{alternative list to supply if file is missing}
}
\description{
Function to read digest header
}
