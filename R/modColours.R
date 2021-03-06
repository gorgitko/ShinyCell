#' Modify the colour palette for categorical metadata
#'
#' Modify the colour palette for categorical metadata.
#'
#' @param scConf shinycell config data.table
#' @param meta.to.mod metadata for which to modify the colour palette. Users 
#'   can either use the actual metadata column names or display names. Please 
#'   specify only one metadata
#' @param new.colours character vector of new colour palette
#' 
#' @return updated shinycell config data.table
#'
#' @author John F. Ouyang
#'
#' @import data.table
#'
#' @examples
#' scConf = modColours(scConf, meta.to.mod = "library", 
#'                     new.colours = c("black", "darkorange", "blue", "red"))
#'
#' @export
modColours <- function(scConf, meta.to.mod, new.colours){
  # Check that only one metadata is provided
  if(length(meta.to.mod) != 1){
    stop("Please specify only one metadata to modify colour palette!")
  }
  
  # Check if meta.to.mod exist
  if(meta.to.mod %in% scConf$ID){
    useID = TRUE   # Use IDs
  } else if(meta.to.mod %in% scConf$UI){
    useID = FALSE  # Use UIs
  } else {
    stop("meta.to.mod not found in shinycell config!")
  }
  
  # Check if new.colours are valid colours
  res = try(col2rgb(new.colours), silent = TRUE)
  if("try-error" %in% class(res)){
    stop("invalid colours are provided!")
  }
  
  # Check if meta.to.mod is categorical and if length(new.colours) matches 
  if(useID){
    res = strsplit(scConf[ID == meta.to.mod]$fCL, "\\|")[[1]]
  } else {
    res = strsplit(scConf[UI == meta.to.mod]$fCL, "\\|")[[1]]
  }
  if(is.na(res[1])){
    stop("meta.to.mod is not a categorical metadata!")
  }
  if(length(res) != length(new.colours)){
    stop("Length of new.colours does not match!")
  }
  
  # Start changing the colours
  if(useID){
    scConf[ID == meta.to.mod]$fCL = paste0(new.colours, collapse = "|")
  } else {
    scConf[UI == meta.to.mod]$fCL = paste0(new.colours, collapse = "|")
  }
  return(scConf)
}


