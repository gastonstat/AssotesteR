\name{CMC}
\alias{CMC}
\title{CMC: Combined Multivariate and Collapsing Method}
\description{
  The CMC method is a pooling approach proposed by Li and Leal (2008) that uses allele frequencies to determine the partition of the variants into groups. After the rare variants are selected, they are collapsed into an indicator variable, and then a multivariate test such as Hotelling's T2 test is applied to the collection formed by the common variants and the collapsed super-variant.
}
\usage{
  CMC(y, X, maf = 0.05, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ numeric value indicating the minor allele frequency threshold for rare variants (\code{maf=0.05} by default)}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  Those variants with minor allele frequency below the specified \code{maf} threshold are collapsed into a single super variant \cr
  
  There is no imputation for the missing data. Missing values are simply ignored in the computations.  
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{cmc.stat}{ cmc statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, rare variants, maf threshold, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Li B, Leal SM (2008) Methods for Detecting Associations with Rare Variants for Common Diseases: Application to Analysis of Sequence Data. \emph{The American Journal of Human Genetics}, \bold{83}: 311-321
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{WSS}}, \code{\link{CMAT}}, \code{\link{TTEST}}
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
  phenotype = c(rep(1,cases), rep(0,controls))

  # genotype matrix with 10 variants (random data)
  set.seed(1234)
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply CMC with maf=0.05 and 500 permutations
  mycmc = CMC(phenotype, genotype, maf=0.05, perm=500)
  mycmc
  }
}


