\name{RBT}
\alias{RBT}
\title{RBT: Replication Based Test}
\description{
  The Replication-Based Test has been proposed by Ionita-Laza et al (2011). RBT is based on a weighted-sum statistic that is similar to a pooled association test but purposefully designed to deal with possibly different association directions. The significance of the statistic has to be calculated by permutations.
}
\usage{
  RBT(y, X, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{rbt.stat}{ rbt statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Ionita-Laza I, Buxbaum JD, Laird NM, Lange C (2011) A New Testing Strategy to Identify Rare Variants with Either risk or Protective Effects on Disease. \emph{PLoS Genetics}, \bold{7(2)}: e1001289 
}
\author{
 Gaston Sanchez
}
\seealso{
  \code{\link{WSS}}, \code{\link{CMC}}
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

  # genotype matrix with 10 variants (random data)
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)

  # apply RBT with 500 permutations
  myrbt = RBT(phenotype, genotype, perm=500)
  myrbt
  }
}


