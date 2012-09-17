\name{CALPHA}
\alias{CALPHA}
\title{CALPHA: C-alpha Score Test}
\description{
  The C-alpha score-test of Neyman and Scott (1966) has been proposed to be used in association astudies by Neale et al (2011) in order to test the observed distributino of rare variants in cases versis controls. Under the null hypothesis of no association between the variants and the phenotype, C-alpha assumes that the distribution of counts (copies of an observed variant) should follow a binomial distribution. The C-alpha test statistic contrasts the variance of each observed count with the expected variance, assuming the binomial distribution. Under the null hypothesis, the test statistic follows a standard normal distribution
}
\usage{
  CALPHA(y, X, perm = NULL)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{perm}{ positive integer indicating the number of permutations (\code{NULL} by default)}
}
\details{
  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{calpha.stat}{ c-alpha statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value; only when \code{perm} is used}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Neyman J, Scott E (1966) On the use of c-alpha optimal tests of composite hypothesis. \emph{Bulletin of the International Statistical Institute}, \bold{41}: 477-497 \cr

  Neale BM, Rivas MA, Voight BF, Altshuler D, Devlin B, Orho-Melander M, Kathiresan S, Purcell SM, Roeder K, Daly MJ (2011) Testing for an unusual distribution of rare variants. \emph{PLoS Genetics}, \bold{7(3)}: e1001322 \cr

  Basu S, Pan W (2011) Comparison of Statistical Tests for Disease Association With Rare Variants. \emph{Genetic Epidemiology}, \bold{35(7)}: 606-619 
}
\author{
  Gaston Sanchez
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
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.10), nrow=total, ncol=10)

  # apply CALPHA with 500 permutations
  mycalpha = CALPHA(phenotype, genotype, perm=500)

  # this is what we get
  mycalpha
  }
}




