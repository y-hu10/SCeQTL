% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc.p.value.R
\name{cal.pvalue}
\alias{cal.pvalue}
\title{Calculatre and return P value of gene-SNV pairs.}
\usage{
cal.pvalue(gene, snp, thread = 8, remove_outlier = TRUE, EM = TRUE,
  dist = "negbin", type = 0)
}
\arguments{
\item{gene}{A gene expression matrix where each row is one gene and each column is one sample}

\item{snp}{A genotype matrix where each row is one variant and each column is one sample}

\item{thread}{Number of threads that are used. DEFAULT option is 8.}

\item{remove_outlier}{whether program should remove samples whose expression level are far away from the others(>median+4*mad). DEFAULT option is TRUE.}

\item{EM}{use EM(TRUE) or BGFS(FALSE) to optimaize. Default option is TRUE}

\item{dist}{distribution assumption, could be negative binomial(negbin) or Poisson(poisson). Default option is negative bionomial.}

\item{type}{which kind of difference you are interested in. type 0 means non-zero part difference, type 1 means zero ratio difference, type 2 means at least one or non-zero part or zero ratio difference. Default option is 0.}
}
\value{
A data frame containing the SCeQTL result. Rows are gene-snp pair and columns contain the following
\itemize{
 \item gene the gene name
 \item snp the snp name
 \item pvalue the p-value of the gene-snp pair
}
}
\description{
Calculatre and return P value of gene-SNV pairs.
}
\examples{
pvalue <- cal.pvalue(gene, snp)
pvalue <- cal.pvalue(gene, snp, thread = 16)
pvalue <- cal.pvalue(gene, snp, remove_outlier = FALSE)
pvalue <- cal.pvalue(gene, snp, EM = FALSE)
pvalue <- cal.pvalue(gene, snp, dist = 'poisson')
pvalue <- cal.pvalue(gene, snp, type = 2)
}
\seealso{
Before calculating p-value, you may want to check whether Poisson or negative bionomial is better using \link{checkdist}. And you could normalize the gene expression matrix by \link{normalize}. You could also calculate q value by \link{cal.qvalue}. After you get significant result, you could check it by \link{check.sample}.
}
