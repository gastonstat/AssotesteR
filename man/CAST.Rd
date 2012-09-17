\name{CAST}
\alias{CAST}
\title{CAST: Cohort Allelic Sums Test}
\description{
  CAST is a pooled association test applied to discover if the difference in the sums of allelic mutation frequencies in case and control cohorts is greater than would be expected by chance. CAST works by first collapsing the genotypes across rare variants to generate a super-variant. It then tests the association between the trait and this new super-variant.
}
\usage{
  CAST(y, X, maf = 0.05,  test = "fisher")
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ numeric value indicating the minor allele frequency threshold for rare variants (\code{maf=0.05} by default)}
  \item{test}{ character string indicating the type of test to be applied. Possible values are \code{"fisher"} and \code{"chisq"} (\code{test="fisher"} by default)}
}
\details{
  If no variants are below the specified \code{maf} threshold, the function will stop and return an error message \cr

  The argument \code{test="fisher"} involves a fisher exact test. Conversely, \code{test="chisq"} indicates a chi-square test. \cr

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{cast.stat}{ cast statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, maf, and applied test}
  \item{name}{ name of the statistic}
}
\references{
  Morgenthaler S, Thilly WG (2007) A strategy to discover genes that carry multi-allelic or mono-allelic risk for common diseases: A cohort allelic sums test (CAST). \emph{Mutation Research}, \bold{615}: 28-56
}
\author{
  Gaston Sanchez
}
\seealso{\code{link{TTEST}}}
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
 
  # apply CAST with fisher exact test 
  mycast1 = CAST(phenotype, genotype, maf=0.05, test = "fisher")
  mycast1

  # apply CAST with chi-square test 
  mycast2 = CAST(phenotype, genotype, maf=0.05, test = "chisq")
  mycast2
  }
}


