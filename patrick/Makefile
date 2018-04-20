RSCRIPT= Rscript --vanilla

all: patrick.md

%.md: %.Rmd
	$(RSCRIPT) -e 'knitr::knit("$<")'
