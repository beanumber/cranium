% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radial_bridge.R
\name{image.brain}
\alias{image.brain}
\title{Plot a slice of a 3D image}
\usage{
\method{image}{brain}(x, z = NULL, ...)
}
\arguments{
\item{x}{locations of grid lines at which the values in \code{z} are
    measured.  These must be finite, non-missing and in (strictly)
    ascending order.  By default, equally
    spaced values from 0 to 1 are used.  If \code{x} is a \code{list},
    its components \code{x$x} and \code{x$y} are used for \code{x}
    and \code{y}, respectively. If the list has component \code{z} this
    is used for \code{z}.}

\item{z}{slice of the 3D image to display}

\item{...}{\link{graphical parameters} for \code{\link{plot}} may also be
    passed as arguments to this function, as can the plot aspect ratio
    \code{asp} and \code{axes} (see \code{\link{plot.window}}).}
}
\description{
Plot a slice of a 3D image
}
\examples{
file <- "~/Data/barresi/AT_1_Probabilities.h5"
raw <- read_h5(file)
image(raw)
image(raw, z = 23)
}
