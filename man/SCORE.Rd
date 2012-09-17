\name{SCORE}
\alias{SCORE}
\title{SCORE: Score Test (from Logistic Regression)}
\description{
  The Score test is one of the statistical tests used for logistic regression models, which is one of the standard approaches used in genetic association studies. Under the null hypothesis that there is no associated variants within the examined region, the test statistic has an asymptotic chi-square distribution. In addition, a permutation procedure can be applied to assess the significance of the test.
}
\usage{
  SCORE(y, X, perm = 100)
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
  \item{score.stat}{ score statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Clayton D, Chapman J, Cooper J (2004) Use of unphased multilocus genotype data in indirect association studies. \emph{Genetic Epidemiology}, \bold{27}: 415-428 \cr

  Chapman J, Whittaker J (2008) Analysis of Multiple SNPs in a Candidate Gene or Region. \emph{Genetic Epidemioloy}, \bold{32}: 560-566

}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{SSU}}, \code{\link{SSUW}}, \code{\link{SUM}}  
}
\examples{
  \dontrun{
  
  # number of cases
  cases = 500

  # number of controls
  controls = 500

  # total (cases + controls)
  total = cases + controls

  # phenotype (first column of genodata)
  phenotype = c(rep(1, cases), rep(0, controls))

  # genotype matrix with 10 variants (random data)
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)

  # apply SCORE with 500 permutations
  myscore = SCORE(phenotype, genotype, perm=500)
  myscore
  }
}


