\name{WSS}
\alias{WSS}
\title{WSS: Weighted Sum Statistic}
\description{
  The WSS method has been proposed by Madsen and Browning (2009) as a pooling approach. In WSS, rare-variant counts within the same gene for each individual are accumulated rather than collapsing on them. Second, it introduces a weighting term to emphasize alleles with a low frequency in controls. Finally, the scores for all samples are ordered, and the WSS is computed as the sum of ranks for cases. The significance is determined by a permutation procedure.
}
\usage{
  WSS(y, X, perm = 100)
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
  \item{wss.stat}{ wss statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Madsen BE, Browning SR (2009) A Groupwise Association Test for Rare Mutations Using a Weighted Sum Statistic. \emph{PLoS Genetics}, \bold{5(2)}: e1000384
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{CMC}} 
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

  # apply WSS with 500 permutations
  mywss = WSS(phenotype, genotype, perm=500)
  mywss
  }
}

