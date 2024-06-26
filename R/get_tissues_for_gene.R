#' Title
#'
#' Get tissues where a gene has eQTLs.
#'
#' @param gene_symbol_of_interest
#'
#' @return
#' @export
#'
#' @examples
get_tissues_for_gene <- function(gene_symbol_of_interest) {

gene_gencodeId_of_interest <- gtexr::get_genes(gene_symbol_of_interest) |>
  dplyr::pull(gencodeId) |>
  suppressMessages()

gene_gencodeId_of_interest |>
  gtexr::get_significant_single_tissue_eqtls() |>
  dplyr::distinct(geneSymbol, gencodeId, tissueSiteDetailId)
}
