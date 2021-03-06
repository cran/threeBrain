% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fs_import.R
\name{import-fs-suma}
\alias{import-fs-suma}
\alias{import_fs}
\alias{import_suma}
\title{Import 'FreeSurfer' or 'SUMA' files into the viewer structure}
\usage{
import_fs(
  subject_name,
  fs_path,
  quiet = FALSE,
  dtype = c("T1", "surface", "curv", "atlas_volume", "atlas_surface", "xform"),
  sub_type = NULL,
  hemisphere = c("l", "r"),
  ...
)

import_suma(
  subject_name,
  fs_path,
  quiet = FALSE,
  dtype = c("T1", "surface", "curv", "atlas_volume", "atlas_surface", "xform"),
  sub_type = NULL,
  hemisphere = c("l", "r"),
  ...
)
}
\arguments{
\item{subject_name}{character, subject code}

\item{fs_path}{path to 'FreeSurfer' folder}

\item{quiet, ...}{passed from or to other methods.}

\item{dtype}{data type to import, choices are \code{'T1'}, \code{'surface'},
\code{'curv'}, \code{'atlas_volume'}, \code{'atlas_surface'}, \code{'xform'}}

\item{sub_type}{detailed files to import. \code{'atlas_surface'}
is not supported for now}

\item{hemisphere}{which hemisphere to import, ignored when \code{dtype} is in
\code{'T1'}, \code{'atlas_volume'}, \code{'atlas_surface'}, \code{'xform'}.}
}
\value{
logical, \code{TRUE} if the file is or has been cached, or
\code{FALSE} if the file is missing.
}
\description{
Import 'T1-MRI', surface files, curvature/'sulcus', atlas, and
'Talairach' transform matrix into 'json' format. These functions are not
intended to be called directly, use \code{\link{import_from_freesurfer}}
instead.
}
