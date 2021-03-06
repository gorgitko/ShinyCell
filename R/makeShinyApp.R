#' Make a shiny app
#'
#' Make a shiny app based on the shinycell config data.table and single-cell 
#' data object.
#'
#' @param obj input single-cell data object. Both Seurat objects (v3+) and 
#'   SingleCellExperiment objects are accepted.
#' @param scConf shinycell config data.table
#' @param gex.assay assay in single-cell data object to use for plotting 
#'   gene expression. Default is to either use the "RNA" assay for Seurat 
#'   objects (v3+) or the "logcounts" assay for SingleCellExperiment objects
#' @param gex.slot slot in single-cell assay to plot. This is only used 
#'   for Seurat objects (v3+). Default is to use the "data" slot
#' @param gene.mapping specifies whether to convert Ensembl gene IDs (e.g. 
#'   ENSG000xxx / ENSMUSG000xxx) into more "user-friendly" gene symbols. Set 
#'   this to \code{TRUE} if you are using Ensembl gene IDs. Default is 
#'   \code{FALSE} which is not to perform any conversion. Alternatively, users 
#'   can supply a named vector where \code{names(gene.mapping)} correspond 
#'   to the actual gene identifiers in the gene expression matrix whereas 
#'   \code{gene.mapping} correspond to new identifiers to map to
#' @param shiny.title title for shiny app
#' @param shiny.footnotes text for shiny app footnote. Can be used to insert 
#'   citations for the single-cell data
#' @param shiny.dir specify directory to create the shiny app in. Default is 
#'   to create a new directory named "shinyApp"
#' @param default.gene1 specify primary default gene to show
#' @param default.gene2 specify secondary default gene to show
#' @param default.multigene character vector specifying the default genes to 
#'   show in bubbleplot / heatmap
#' @param default.dimred character vector specifying the two default dimension 
#'   reductions 
#'
#' @return directory containing shiny app
#'
#' @author John F. Ouyang
#'
#' @import data.table hdf5r
#'
#' @examples
#' footnote = paste0(
#'   'strong("Reference: "), "Liu X., Ouyang J.F., Rossello F.J. et al. ",',
#'   'em("Nature "), strong("586,"), "101-107 (2020) ",',
#'   'a("doi:10.1038/s41586-020-2734-6",',
#'   'href = "https://www.nature.com/articles/s41586-020-2734-6",',
#'   'target="_blank"), style = "font-size: 125%;"'
#' )
#' makeShinyApp(seu, scConf, 
#'              shiny.title = "scRNA-seq Shiny app",
#'              shiny.dir = "shinyApp/", shiny.footnotes = footnote,
#'              default.gene1 = "NANOG", default.gene2 = "DNMT3L",
#'              default.multigene = c("ANPEP","NANOG","ZIC2","NLGN4X","DNMT3L",
#'                                    "DPPA5","SLC7A2","GATA3","KRT19")) 
#'
#' @export
makeShinyApp <- function(
  obj, scConf, gex.assay = NA, gex.slot = c("data", "scale.data", "counts"), 
  gene.mapping = FALSE, 
  shiny.title = "scRNA-seq shiny app", shiny.footnotes = '""',
  shiny.dir = "shinyApp/", 
  default.gene1 = NA, default.gene2 = NA, default.multigene = NA, 
  default.dimred = c("UMAP_1", "UMAP_2")){
  
  # Checks are performed in respective functions
  # Wrapper for two main functions
  makeShinyFiles(obj = obj, scConf = scConf, 
                 gex.assay = gex.assay[1], gex.slot = gex.slot[1], 
                 gene.mapping = gene.mapping, 
                 shiny.prefix = "sc1", shiny.dir = shiny.dir,
                 default.gene1, default.gene2, default.multigene, default.dimred)
  makeShinyCodes(shiny.title = shiny.title, shiny.footnotes = shiny.footnotes,
                 shiny.prefix = "sc1", shiny.dir = shiny.dir)

}


