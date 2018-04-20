RSCRIPT= Rscript --vanilla

all: README.md patrick.md

%.md: %.Rmd
	$(RSCRIPT) -e 'knitr::knit("$<")'
