\name{SEQSUM}
\alias{SEQSUM}
\title{SEQSUM: Sequential Sum Score Test}
\description{
  SEQSUM has been proposed by Basu and Pan (2011) as a modification of the Sum test based on a model selection approach, following a similar philosophy as the CARV and RARECOVER methods. Assuming that there are M variants, the main idea behind the Sequential Sum test is to associate a sign to each variant indicating whether it has a positive effect or a negative effect. In other words, the purpose is to give signs to the variants so they reflect their effect (positive or negative).
}
\usage{
  SEQSUM(y, X, perm = 100)
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
  \item{seqsum.stat}{ seqsum statistic}
  \item{perm.pval}{ permuted p-value}
  \item{signs}{ a numeric vector with signs for the variants (1=positive, -1=negative)}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Basu S, Pan W (2011) Comparison of Statistical Tests for Disease Association with Rare Variants. \emph{Genetic Epidemiology}, \bold{35}: 606-619 \cr
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{SCORE}}, \code{\link{SUM}}
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

  # apply SEQSUM with 500 permutations
  myseq = SEQSUM(phenotype, genotype, perm=500)
  myseq
  }
}


