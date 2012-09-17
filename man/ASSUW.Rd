\name{ASSUW}
\alias{ASSUW}
\alias{ASSUW.Ord}
\title{ASSUW: Adaptive Sum of Squared Score U Statistic}
\description{
  The adaptive Weighted Score test has been proposed by Han and Pan (2010) in an attempt to overcome some of the drawbacks of the SSUW test, by extending the idea of the adaptive Neyman's test (Fan, 1996). The approach behind the adaptive test is to use the U-statistics of the score test (from logistic regression models) in order to construct a statistic with the first components of the score vector U.
}
\usage{
  ASSUW(y, X, perm = 100)

  ASSUW.Ord(y, X, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  \code{ASSUW} gives the normal (unordered) test. \cr
  \code{ASSUW.Ord} gives the ordered (decreasing) test. \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{assuw.stat}{ assuw statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Han F, Pan W (2010) A Data-Adaptive Sum Test for Disease Association with Multiple Common or Rare Variants. \emph{Human Heredity}, \bold{70}: 42-54 \cr

  Pan W, Shen X (2011) Adaptive Tests for Association of Rare Variants. \emph{Genetic Epidemiology}, \bold{35}: 381-388
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{SSUW}}
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

  # apply ASSUW with 500 permutations
  myassuw = ASSUW(phenotype, genotype, perm=500)
  myassuw

  # apply ASSUW.Ord with 500 permutations
  myassuword = ASSUW.Ord(phenotype, genotype, perm=500)
  myassuword
  }
}

