\name{CARV}
\alias{CARV}
\title{CARV: Comprehrensive Approach to Analyzing Rare Variants}
\description{
  The CARV method has been proposed by Hoffmann et al (2010) as an approach that determines an optimal grouping of rare variants while avoiding assumptions required by other methods for grouping such variants. The idea behind CARV is to try multiple models for rare variants, since prior information is generally not very accurate. Statistical significance is obtained by permutation. 
}
\usage{
  CARV(y, X, waf = FALSE, signs = FALSE, approach = "hard", maf = 0.05, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{waf}{ logical value to indicate whether weights for the variants should be calculated as in the \code{WSS} method (default \code{waf=FALSE}). See deatils below}
  \item{signs}{ logical value to indicate whether signs for the variants should be calculated based on allele prevalence (\code{signs=FALSE} by default). See details below}
  \item{approach}{ character string to indicate the type of approach to be used for variable selection; i.e. whether each variant belongs in the model for variable selection (\code{approach="hard"} by default). Possible options are \code{"hard"}, \code{"variable"}, and \code{"stepup"}. See details below}
  \item{maf}{ numeric value between 0 and 1 to indicate the threshold of minor allele frequency for rare variants. Only used when \code{approach="hard"}}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  The argument \code{waf} is used to specify weights of the variants in order to incorporate allele frequency information. When \code{waf=FALSE}, all variants have a constant unit weight. When \code{waf=TRUE}, the weights are calculated as in the function \code{\link{WSS}}, that is, weights are the inverse variance of allele frequency in controls. \cr

  The argument \code{signs} is used to specify the direction of the variant effect (deleterious or protective). When \code{signs=FALSE}, all variants have a positive sign indicating a likely deleterious effect. When \code{signs=TRUE}, all rare alleles that are more prevalent in controls than cases will have an associated sk=-1 (see paper in the reference); conversely, all the rare alleles that are more prevalent in cases than controls will have an associated sk=1. \cr 

  The argument \code{approach} is used to specify whether the alle belongs in the model for variable selection. When \code{approach="hard"}, only variants below the predefined \code{maf} are included in the analysis. When \code{approach="variable"}, a variable threshold approach is used as in the \code{\link{VT}} method: all possible minor allele frequencies are considered, selecting the maximum statistic among all of them. When \code{approach="stepup"}, the step-up strategy described in Hoffman et al (2010) is applied. \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{carv.stat}{ carv statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, permutations, waf, signs, approach, and maf}
  \item{name}{ name of the statistic}
}
\references{
  Hoffmann TJ, Marini NJ, Witte JS (2010) Comprehensive Approach to Analyzing Rare Genetic Variants. \emph{PLoS One}, \bold{5(11)}: e13584
}
\author{
 Gaston Sanchez
}
\seealso{
  \code{\link{RARECOVER}}
}
\examples{
  \dontrun{
  
  # number of cases
  cases = 500

  # number of controls
  controls = 500

  # total (cases + controls)
  total = cases + controls

  # phenotype vector
  phenotype = c(rep(1, cases), rep(0, controls))

  # define genotype matrix with 10 variants (random data)
  set.seed(1234)
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply CARV with "hard" approach and maf=0.05
  mycarv1 = CARV(phenotype, genotype, waf=FALSE, signs=FALSE, 
     approach="hard", maf=0.05, perm=500)
  mycarv1

  # apply CARV with "variable" approach and waf=TRUE
  mycarv2 = CARV(phenotype, genotype, waf=TRUE, signs=FALSE,
     approach="variable", perm=500)
  mycarv2

  # apply CARV with "stepup" approach, waf=TRUE, and signs=TRUE
  mycarv3 = CARV(phenotype, genotype, waf=TRUE, signs=TRUE,
     approach="stepup", perm=500)
  mycarv3

  }
}


