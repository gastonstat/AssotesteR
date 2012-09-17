\name{RVT2}
\alias{RVT2}
\title{RVT2: Rare Variant Test 2 for dichotomous traits}
\description{
  RVT2 is a collapsing method developed by Morris and Zeggini (2010) based on a regression framework that models the phenotype as a function of a collapsed summary of the variants. In the case of RVT@, the collapsed summary consists of the presence or absence of at least one minor allele at any rare variant. In this sense, RVT2 is an accumulation approach that regresses phenotype on a genetic score, defined as the presence of at least one minor allele at any rare variant
}
\usage{
  RVT2(y, X, maf = 0.05, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ numeric value indicating minor allele frequency threshold for rare variants (\code{maf=0.05} by default)}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  If no variants are below the specified \code{maf} threshold, the function will stop and return an error message \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{rvt2.stat}{ rvt2 statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, rare variants, maf threshold, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Morris AP, Zeggini E (2010) An Evaluation of Statistical Approaches to Rare Variants Analysis in Genetic Association Studies. \emph{Genetic Epidemiology}, \bold{34}: 188-193 \cr

  Asimit J, Zeggini E (2010) Rare Variant Association Analysis Methods for Complex Traits. \emph{Annual Review of Genetics}, \bold{44}: 293-308
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{RVT1}}
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
  set.seed(1234)
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply RVT2 with maf=0.05 and 500 permutations
  myrvt2 = RVT2(phenotype, genotype, maf=0.05)
  myrvt2 
  }
}


