\name{BST}
\alias{BST}
\title{BST: Bayesian Score Test}
\description{
  BST is based on the test statistic of Goeman et al (2005) following a general empirical Bayes method to test on a large number of parameters in a logistic regression model. BST is closely related to the usual Score test, although it assumes an empirical Bayesian model with an independent prior on the genetic variant effects. The null distribution of the BST statistic is unknown and has to be estimated by permutation.
}
\usage{
  BST(y, X, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  The BST statistic does not offer an asymptotic p-value. Permutations are required \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{bst.stat}{ bst statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Goeman JJ, van de Geer SA, van Houwelingen HC (2006) Testing against a high dimensional alternative. \emph{Journal of the Royal Statistical Society}, \bold{68}: 477-493 \cr

  Chapman J, Whittaker J (2008) Analysis of Multiple SNPs in a Candidate Gene or Region. \emph{Genetic Epidemiology}, \bold{32}: 560-566 \cr

  Pan W (2009) Asymptotic Tests of Association with Multiple SNPs in Linkage Disequilibrium. \emph{Genetic Epidemiology}, \bold{33}: 497-507
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
  phenotype = c(rep(1,cases), rep(0,controls))
  
  # genotype matrix with 10 variants (random data)
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)
  
  # apply BST with 500 permutations
  mybst = BST(phenotype, genotype, perm=500)  
  mybst
  }
}

