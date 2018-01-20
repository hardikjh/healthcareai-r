#' Supported models and their hyperparameters
#'
#' @description
#'
#' \strong{Random Forest}: "rf". Regression and classification.
#' Implemented via \code{ranger}.
#' \itemize{
#'   \item{mtry: Fraction of variables to consider for each split}
#'   \item{splitrule: Splitting rule. For classification either "gini" or
#'   "extratrees". For regression either "variance", "extratrees", or
#'   "maxstat".}
#'   \item{min.node.size: Minimal node size.}
#' }
#'
#' \strong{k-nearest neighbors}: "knn". Regression and classification.
#' Implemented via \code{kknn}.
#' \itemize{
#'   \item{kmax: Number of neighbors to consider.}
#'   \item{distance: Minkowsky distance parameter, (0, Inf). 1 = Manhatten, 2 =
#'   Euclidian, -> Inf = Chebyshev.}
#'   \item{kernal: Kernal to use. Possible choices are "rectangular" (standard
#'   knn), "triangular", "epanechnikov", "biweight", "triweight", "cos", "inv",
#'   "gaussian", "rank", or "optimal".}
#' }
#'
#' @name supported_models
#' @aliases models models_supported
NULL