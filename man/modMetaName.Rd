% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modMetaName.R
\name{modMetaName}
\alias{modMetaName}
\title{Modify the display name of metadata}
\usage{
modMetaName(scConf, meta.to.mod, new.name)
}
\arguments{
\item{scConf}{shinycell config data.table}

\item{meta.to.mod}{metadata for which to modify the display name. Users can 
either use the actual metadata column names or display names. Multiple 
metadata can be specified. It is reccomended to use the original metadata 
column names to reduce confusion.}

\item{new.name}{new display names for the corresponding metadata}
}
\value{
updated shinycell config data.table
}
\description{
Modify the display name of metadata. It is possible that the original 
metadata name is not so informative e.g "orig.ident" or too long e.g. 
"seurat_clusters" and users want to shorten the way they are displayed 
on the shiny app. This function allows users to specify display names for 
metadata i.e. the names that will be displayed on the shiny app. Note that 
\code{showLegend} shows the display name instead of the actual name.
}
\examples{
scConf = modMetaName(scConf, 
                     meta.to.mod = c("orig.ident", "seurat_clusters"), 
                     new.name = c("library", "cluster"))

}
\author{
John F. Ouyang
}
