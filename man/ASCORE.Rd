\name{ASCORE}
\alias{ASCORE}
\alias{ASCORE.Ord}
\title{ASCORE: Adaptive Score Test}
\description{
  The Adaptive Score test has been proposed by Hand and Pan (2010) in an attempt to overcome some of the drawbacks of the Score test (from logistic regression) by extending the idea of the adaptive Neymans test. The approach behind the adaptive test is to use the the first components of the U-score vector in order to construct a test statistic
}
\usage{
  ASCORE(y, X, perm = 100)

  ASCORE.Ord(y, X, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  \code{ASCORE} gives the normal (unordered) test. \cr
  \code{ASCORE.Ord} gives the ordered (decreasing) test. \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{ascore.stat}{ascore statistic}
  \item{perm.pval}{permuted p-value}
  \item{args}{descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{name of the statistic}
}
\references{
  Han F, Pan W (2010) A Data-Adaptive Sum Test for Disease Association with Multiple Common or Rare Variants. \emph{Human Heredity}, \bold{70}: 42-54 \cr

  Pan W, Shen X (2011) Adaptive Tests for Association of Rare Variants. \emph{Genetic Epidemiology}, \bold{35}: 381-388   
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{SCORE}}
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

  # apply ASCORE with 500 permutations
  myascore = ASCORE(phenotype, genotype, perm=500)
  myascore

  # apply ASCORE.Ord with 500 permutations
  myascoreord = ASCORE.Ord(phenotype, genotype, perm=500)
  myascoreord
  }
}


