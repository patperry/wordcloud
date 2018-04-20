RSCRIPT= Rscript --vanilla

all: README.md

%.md: %.Rmd
	$(RSCRIPT) -e 'knitr::knit("$<")'
