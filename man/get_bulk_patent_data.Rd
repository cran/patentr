% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/acquire.R
\name{get_bulk_patent_data}
\alias{get_bulk_patent_data}
\title{Get Bulk Patent Data from USPTO}
\usage{
get_bulk_patent_data(year, week, output_file = NULL)
}
\arguments{
\item{year}{integer vector containing years from which patents should be
collected}

\item{week}{integer vector of weeks within the corresponding `year` element
from which patents should be collected}

\item{output_file}{if `NULL`, returns a data frame; if a `character`
(single-element vector), will output to that file in CSV format}
}
\value{
either `TRUE` (placeholder) or object of class `data.frame` (see
  param `output_file` for details)
}
\description{
Download and convert bulk patent data to tidy format from the
USPTO website <https://bulkdata.uspto.gov>. Data can be returned as a data
frame or written to a file (see `output_file` parameter). Since USPTO issues
patents weekly, at minimum, all patents from a given week must be acquired
at once.
}
\examples{
## NOTE: none of the examples are run due to the download requirement
\dontrun{
# download patents from the first week of 1976 and get data frame
patent_data <- get_bulk_patent_data(year = 1976, week = 1)

# download patents from the last 5 weeks of 1980 (and write to a file)
get_bulk_patent_data(year = rep(1980, 5), week = 48:52,
                     output_file = "patent-data.csv")
}
}
