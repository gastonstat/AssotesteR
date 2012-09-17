\name{SSUW}
\alias{SSUW}
\title{SSUW: Weighted Sum of Squared Score U Statistic}
\description{
  SSUW s been proposed by Pan (2009) as a modified test based on the score-type U statistic (i.e. logistic regression). More specifically, SSUW is a test based on a weighted sum of the squares of the marginal score statistics. Its null distribution have a quadratic form and can be approximated by a chi-square distribution.  
}
\usage{
  SSUW(y, X, perm = 100)
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
  \item{ssuw.stat}{ ssuw statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Pan W (2009) Asymptotic tests of association with multiple SNPs in linkage disequilibrium. \emph{Genetic Epidemiology}, \bold{33}: 497-507 \cr

  Pan W, Han F, Shen X (2010) Test Selection with Application to Detecting Disease Association with Multiple SNPs. \emph{Human Heredity}, \bold{69}: 120-130
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{SCORE}}, \code{\link{SSU}}, \code{\link{SUM}}
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

  # apply SSUW with 500 permutations
  myssuw = SSUW(phenotype, genotype, perm=500)
  myssuw
  }
}


