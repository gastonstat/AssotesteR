\name{MULTI}
\alias{MULTI}
\title{MULTI: Multiple Tests}
\description{
  Performs multiple association tests. 
}
\usage{
  MULTI(y, X, tests, maf = 0.05, perm = 100, weights = NULL, c.param = NULL)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{tests}{ character vector with names of the tests to be applied }
  \item{maf}{ numeric value indicating the minor allele frequency threshold for rare variants (\code{maf=0.05} by default)}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
  \item{weights}{ optional vector of weights for the variants (\code{NULL} by default}
  \item{c.param}{ Optional value to specify the \code{c} parameter when applying \code{ORWSS}}
}
\details{
  The available tests are: \code{"WSS", "ORWSS", "RWAS", "CMC", "CMAT", "CALPHA", "RBT", "SCORE", "SUM", "SSU", "SSUW", "UMINP", "BST", "WST", "RVT1", "RVT2", "VT"} \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{A data frame with test statistics and permutated p-values
}
\author{
  Gaston Sanchez
}
\examples{
  \dontrun{
  
  # number of cases
  cases = 250

  # number of controls
  controls = 250

  # total (cases + controls)
  total = cases + controls

  # phenotype vector
  phenotype = c(rep(1, cases), rep(0, controls))

  # genotype matrix with 10 variants (random data)
  set.seed(1234)
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply MULTI with "BST", "CMC", "RWAS" and 100 permutations
  mymulti1 = MULTI(phenotype, genotype, c("BST", "CMC", "RWAS"), perm=100)
  
  # this is what we get
  mymulti1

  # create list with the following tests
  test_list = c("BST", "CMC", "CMAT", "CALPHA", "ORWSS", "RWAS",
      "RBT", "SCORE", "SUM", "SSU", "SSUW", "UMINP", "WSS", "WST")

  # apply MULTI with 100 permutations
  mymulti2 = MULTI(phenotype, genotype, test_list, perm=100)

  # this is what we get
  mymulti2
  }
}

