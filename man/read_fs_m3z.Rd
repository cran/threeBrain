% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{read_fs_m3z}
\alias{read_fs_m3z}
\title{Read `FreeSurfer` m3z file}
\usage{
read_fs_m3z(filename)
}
\arguments{
\item{filename}{file location, usually located at `mri/transforms/talairach.m3z`}
}
\value{
registration data
}
\description{
Read `FreeSurfer` m3z file
}
\details{
An `m3z` file is a `gzip` binary file containing a dense vector
field that describes a 3D registration between two volumes/images.
This implementation follows the `Matlab` implementation from the `FreeSurfer`.
This function is released under the `FreeSurfer` license:
\url{https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferSoftwareLicense}.
}
