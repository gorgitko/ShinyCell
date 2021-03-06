% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/showOrder.R
\name{showOrder}
\alias{showOrder}
\title{Shows the order in which metadata will be displayed}
\usage{
showOrder(scConf)
}
\arguments{
\item{scConf}{shinycell config data.table}
}
\value{
table showing the order in which metadata will be displayed
}
\description{
Shows the order in which metadata will be displayed in the shiny app. This 
helps users to decide if the display order is ok. If not, users can use 
\code{reorderMeta} to change the order in which metadata will be displayed.
}
\examples{
showOrder(scConf)

}
\author{
John F. Ouyang
}
