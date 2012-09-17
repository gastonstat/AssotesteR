\name{VT}
\alias{VT}
\title{VT: Variable Threshold}
\description{
  The Variable Threshold (VT) test has been proposed by Price et al (2010) based on the assumption that the minor allele frequencies of the causal rare variants may be different from those nonfunctional rare variants, which, if true, can be utilized to improve the power of the corresponding pooled association tests. 
The idea behind this approach is that there exists some (unknown) threshold T for which variants with a minor allele frequency (MAF) below T are more likely to be functional than are variants with an MAF above T. VT works by finding the maximum z-score across all possible values for the threshold T. 
}
\usage{
  VT(y, X, maf = 0.05, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ numeric value indicating the minor allele frequency threshold for rare variants (must be a positive number between 0 and 1, \code{maf=0.05} by default)}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{vt.stat}{ vt statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Price AL, Kryukov GV, de Bakker PIW, Purcell SM, Staples J, Wei LJ, Sunyaev SR (2010) Pooled Association Tests for Rare Variants in Exon-Sequencing Studies. \emph{The American Journal of Human Genetics}, \bold{86}: 832-838
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{WSS}}  
}
\examples{
  \dontrun{
  
  # number of cases
  cases = 500

  # number of controls
  controls = 500

  # total (cases + controls)
  total = cases + controls

  #  phenotype vector
  phenotype = c(rep(1, cases), rep(0, controls))

  # genotype matrix with 10 variants (random data)
  set.seed(1234)  
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply VT with maf=0.05 and 500 permutations
  myvt = VT(phenotype, genotype, maf=0.05, perm=500)
  myvt
  }
}


