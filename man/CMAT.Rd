\name{CMAT}
\alias{CMAT}
\title{CMAT: Cumulative Minor Allele Test}
\description{
  CMAT is a pooling method proposed by Zawistowski et al (2010). CMAT works by comparing weighted minor-allele counts (for cases and controls) against the weighted major-allele counts (for cases and controls). Although the CMAT test statistic is based on a chi-square statistic, it does not follow a known distribution and its significance has to be determined by a permutation procedure.
}
\usage{
  CMAT(y, X, maf = NULL, weights = NULL, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ optional numeric value to specify a threshold for the minor allele frequency of rare variants (\code{NULL} by default)}
  \item{weights}{ optional vector of weights for the variants (\code{NULL} by default)}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  By default, argument \code{maf=NULL} meaning that no rare variants are selected \cr

  By default, argument \code{weights=NULL} but different values for the variants can be provided \cr

  Statistical significance is determined by permutation procedure \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{cmat.stat}{ cmat statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, rare variants, maf, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Zawistowski M, Gopalahrishnan S, Ding J, Li Y, Grimm S, Zollner S (2010) \emph{The American Journal of Human Genetics}, \bold{87}: 604-617
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{CMC}}, \code{\link{WSS}}
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
  set.seed(1234)
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply CMAT with 500 permutations
  mycmat1 = CMAT(phenotype, genotype, perm=500)
  mycmat1

  # apply CMAT with maf=0.05 and 500 permutations
  mycmat2 = CMAT(phenotype, genotype, maf=0.05, perm=500)
  mycmat2
  }
}

