% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create.R
\name{get_cran_doi_badge}
\alias{get_cran_doi_badge}
\title{Generate A Static shields.io CRAN DOI Badge}
\usage{
get_cran_doi_badge(package_name, ...)
}
\arguments{
\item{package_name}{Single character string. Must be a package named on CRAN.}

\item{...}{Optional arguments passed to \code{\link{get_badge}}.}
}
\value{
A Markdown text string.
}
\description{
Build a URL string that generates a \href{https://shields.io/}{shields.io}
metadata badge to display your CRAN package's DOI. For convenience, this
function allows you to embed the URL in Markdown with a link and copies this
to the clipboard for use in a README or elsewhere.
}
\examples{
get_cran_doi_badge(
  package_name = "datapasta",
  browser_preview = FALSE,
  to_clipboard = FALSE
)

}
