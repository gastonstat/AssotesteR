\name{TTEST}
\alias{TTEST}
\title{TTEST: Hotelling T2 Test}
\description{
  Generalized T2 test for testing association between genotype variants and binary trait (case-control)
}
\usage{
  TTEST(y, X)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
}
\details{
  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{T2.stat}{ T2 statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, maf, and applied test}
  \item{name}{ name of the statistic}
}
\references{
  Xiong M, Zhao J, Boerwinkle E (2002) Generalized T2 Test for Genome Association Studies. \emph{The American Journal of Human Genetics}, \bold{70}: 1257 - 1268
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{CAST}}
}
\examples{
  \dontrun{
  
  # number of cases
  cases =500

  # number of controls
  controls = 500

  # total (cases + controls)
  total = cases + controls

  # phenotype vector
  phenotype = c(rep(1, cases), rep(0, controls))

  # genotype matrix with 10 variants (random data)
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)

  # apply TTEST 
  myttest = TTEST(phenotype, genotype)
  myttest  
  }
}


