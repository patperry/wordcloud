




```r
## devtools::install_github("kbenoit/sophistication")
## devtools::install_github("patperry/r-frame")
library(corpus)
library(frame)
library(magrittr)
library(wordcloud)
#> Loading required package: methods
#> Loading required package: RColorBrewer
options(format.limit = 30)

corpus <- as_corpus_frame(quanteda::data_corpus_inaugural)
text_filter(corpus)$drop_punct = TRUE
google1grams <- sophistication::data_matrix_google1grams
```


## Vanilla word cloud


```r
stats <- term_stats(corpus)
stats <- as.dataset(stats)
print(stats)
#>    term  count support
#> 1  the   10082      58
#> 2  of     7103      58
#> 3  and    5310      58
#> 4  to     4526      58
#> 5  in     2785      58
#> 6  that   1789      58
#> 7  be     1481      58
#> 8  it     1389      58
#> 9  for    1197      58
#> 10 by     1083      58
#> 11 have   1011      58
#> 12 this    835      58
#> 13 all     819      58
#> 14 are     814      58
#> 15 has     622      58
#> 16 a      2246      57
#> 17 our    2181      57
#> 18 we     1739      57
#> 19 is     1462      57
#> 20 with    958      57
#> 21 not     957      57
#> 22 as      947      57
#> 23 i       838      57
#> 24 but     654      57
#> 25 from    572      57
#> 26 an      390      57
#> 27 so      388      57
#> 28 which  1006      56
#> 29 will    911      56
#> 30 their   753      56
#> ⋮    (9343 rows total)
```


```r
with(stats[1:300,],
     wordcloud(term, count, random.order = FALSE, scale = c(6, .5)))
```

![plot of chunk unnamed-chunk-4](patrick-unnamed-chunk-4-1.png)

## No stop words


```r
print(subset(stats, !term %in% stopwords_en))
#>    term       count support
#> 1  people       575      56
#> 2  us           478      55
#> 3  can          471      55
#> 4  great        340      55
#> 5  may          338      53
#> 6  country      304      53
#> 7  nation       293      53
#> 8  time         216      53
#> 9  government   564      52
#> 10 world        311      52
#> 11 now          224      52
#> 12 must         366      51
#> 13 every        298      51
#> 14 nations      199      51
#> 15 shall        314      50
#> 16 citizens     208      50
#> 17 new          247      49
#> 18 free         183      49
#> 19 good         145      49
#> 20 just         123      49
#> 21 one          252      48
#> 22 life         137      48
#> 23 upon         371      47
#> 24 power        236      47
#> 25 united       202      47
#> 26 men          140      47
#> 27 rights       138      47
#> 28 future        94      47
#> 29 states       333      46
#> 30 peace        254      46
#> ⋮         (9207 rows total)

with(subset(stats, !term %in% stopwords_en),
     wordcloud(term, count, random.order = FALSE, scale = c(6, .5)))
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> administration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> common could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> support could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> purpose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> together could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> necessary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> equal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> institutions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> others could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strength could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> americans could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> means could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> federal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prosperity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> action could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> things could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> change could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> give could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> whose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> republic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> security could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> responsibility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commerce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proper could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> important could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> business could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> subject could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seek could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> found could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revenue could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> character could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> toward could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> principle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> question could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stand could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> called could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> done could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> century could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> democracy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> become could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> course could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> influence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beyond could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strong could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> authority could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> greater could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> economy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> countrymen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constitutional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> happiness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> experience could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> individual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> times could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continue could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resources could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> governments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trade could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nothing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> whether could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> purposes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opportunity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> domestic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> children could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defense could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hand could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opinion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alone could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> effort could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> economic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> success could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maintain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preserve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> therefore could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wisdom could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> independence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hands could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> importance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> either could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> desire could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> parties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affairs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> care could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mind could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> local could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> welfare could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> circumstances could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exercise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> measures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legislation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> taken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> knowledge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> race could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> greatest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mankind could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thought could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blessings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> body could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> danger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> increase could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> generation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> millions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> essential could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> safety could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> throughout could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fellow-citizens could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> peoples could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> courage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hopes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> highest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> civilization could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hold could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> passed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> territory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occasion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> judgment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> require could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> large could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> questions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wealth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> making could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reason could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> countries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> limits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faithful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> certain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> society could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> face could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nature could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pledge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> friends could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> object could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> necessity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> already could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sufficient could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revolution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> view could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abroad could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forward could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> international could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> money could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> america's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> existence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patriotism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destiny could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> permanent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promote could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> population could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> military could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attention could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> members could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> problems could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conditions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speak could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> different could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> education could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obligations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> result could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> community could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> none could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> powerful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> industry could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instrument could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> produce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> back could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> degree could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dangers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> independent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> women could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> industrial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> south could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clear could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fathers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conduct could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discharge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> objects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> equally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mr could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> generations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> single could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> year could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sound could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> portion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> want could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> placed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> self-government could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> happy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> property could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ideals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> almighty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> whatever could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> personal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> away could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ability could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reach could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> think could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> position could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> citizenship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consideration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> election could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> religious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beginning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> humanity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> growth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> honorable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> determined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enterprise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neither could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> truth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dignity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> established could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> responsibilities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> several could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> across could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opinions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> though could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> serve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> provide could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> turn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> peaceful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endeavor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sacred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> practical could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> departments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expression could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preserved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enough could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sovereignty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> feeling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> equality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> needs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> private could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> devotion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> longer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obligation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sacrifice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cooperation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> demand could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> honest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> harmony could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patriotic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> popular could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> put could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> complete could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supreme could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prevent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legislative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> case could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> known could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> measure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conscience could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> family could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> capacity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> merely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> number could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> parts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mutual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perfect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> secured could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> slavery could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deeply could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wrong could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> individuals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> almost could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remember could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> required could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> afford could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> basis could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> created could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> safe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seeking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> credit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> difference could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distinguished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> integrity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preservation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> build could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> communities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> debt could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expenditures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> world's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> capital could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> improvement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> settled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> something could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> formed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> majority could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treaty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> department could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> methods could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> chosen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> matters could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conflict could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> determination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enlightened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perhaps could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> providence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> events could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vital could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> washington could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> young could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> belief could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> failure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destruction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> special could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> values could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> effective could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> granted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indeed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reform could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> officers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> currency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ancient could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> said could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clearly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strengthen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> friendship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> point could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wars could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> benefits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> especially could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> experiment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> days could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> poverty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> provided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nation's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> navy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> understanding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sometimes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> early could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lands could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encourage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> side could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deep could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> express could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instead could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> around could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attempt could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destroy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> difficulties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> living could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> republican could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> direction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encouragement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> practice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prosperous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concern could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manner could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> needed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adequate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> internal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> taxation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leadership could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> journey could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continued could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agriculture could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> difficult could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> energy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> limited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> open could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> path could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> understand could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> add could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> generous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> join could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> chance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> class could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> everywhere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> requires could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> responsible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> results could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> soil could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> struggle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> health could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> increasing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lines could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consider could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> development could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legitimate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> provision could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sections could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> friendly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reserved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> causes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> army could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conviction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> depend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> execute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pride could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> burden could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> committed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intelligence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sentiment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> source could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wisely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> birth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> crisis could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> except could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> passion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> person could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> representatives could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> short could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> simple could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> achieve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> burdens could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enjoy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nearly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> price could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> subjects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> various could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> claim could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> govern could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> greatly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> immediate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> products could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adoption could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dream could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> europe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> higher could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> counsel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> democratic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> former could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> settlement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thank could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confederacy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amendment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enforcement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assume could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> establishment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neighbors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remains could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advantage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brought could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> establish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maintained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> peculiar could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perform could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> realize could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> changes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enemies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maintenance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> modern could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reasonable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> schools could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weak could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> challenge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> least could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> official could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> permit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> branch could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earnest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prescribed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> standards could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enforce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suffrage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treasury could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> existing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forever could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bound could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> places could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> precious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> armed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constantly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> create could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> declared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gratitude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> makes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> productive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> religion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appear could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concerns could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> genius could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> held could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pass could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proud could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restore could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> satisfaction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> second could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strengthened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ocean could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> organization could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> renew could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> idea could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> liberal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> meaning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respective could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> section could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> carried could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exist could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> issue could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> predecessor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commercial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> false could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> policies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sentiments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> naval could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> voices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> coast could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> declaration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accomplished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> born could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> divine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guidance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shown could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> station could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strict could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> balance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bonds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cherish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decisions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> finally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lasting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> serious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> standing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consequences could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> engaged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> founded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> homes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> minds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> north could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pursued could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relief could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dangerous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exists could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faithfully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> families could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manufactures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> practicable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> privilege could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reduce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> save could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seems could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> situation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advancement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advantages could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> built could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> drawn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entire could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> increased could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maintaining could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obvious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> performance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> production could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> challenges could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> construction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> event could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sides could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> term could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> authorities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> connected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> jurisdiction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grateful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pursue could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> belongs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> god's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> justly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> command could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> considered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> move could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prejudice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> receive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rewards could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suffer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suffering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ways could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alike could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> avoid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eyes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> foundations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> natural could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> profound could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sustained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> useful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wherever could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> willing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> answer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> became could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discussion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heretofore could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> privileges could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continuance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> operation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prayer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> violence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> senate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> western could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> controversies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> used could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> close could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> followed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> along could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fixed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> industries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> taking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adopted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> believed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> branches could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> centuries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impossible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leading could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> limitations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> separate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> depression could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> directly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> divided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expenditure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> flag could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> knowing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> plans could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scarcely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> successful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> based could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cheerfully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> country's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> crime could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fundamental could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> generally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> larger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> matter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> member could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> particular could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> persons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promises could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sectional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> written could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aspirations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> court could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> devoted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entitled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forbearance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> greatness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leaders could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> learned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> liberties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> looking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> man's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mean could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remedy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supported could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> universal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> actual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cases could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> late could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> realized could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> southern could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> european could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> partisan could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weapons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> whilst could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> helped could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invasion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legislature could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> likely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> program could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> session could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> employed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> renewed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> declare could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> depends could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disposition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enjoyed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> happily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> humble could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injustice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pledged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sought could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stronger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weight could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aggression could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appeal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> battle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blessed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dedication could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> everything could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expressed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> globe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hour could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imposed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mighty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> next could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recommend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sincere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> talents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> threat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adopt could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advanced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> coming could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consistent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> employment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> founders could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> language could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> loss could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> markets could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> name could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> narrow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possess could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prejudices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> steps could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> succeed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abuses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> certainly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> changed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enduring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> feelings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> growing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pacific could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> predecessors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prepared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preserving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> press could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promoted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stability could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sympathy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> understood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> added could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amount could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> celebrate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> failed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> provisions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tranquillity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tyranny could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contributed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> difficulty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injury could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restoration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surplus could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negro could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bind could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recognize could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anxiety could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> armies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beloved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> civilized could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exalted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> glory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ground could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guide could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lost could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opportunities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opposed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reached could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recognized could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ample could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assured could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> began could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comfort could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cultivate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> division could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elections could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> execution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fulfillment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gone could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> information could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> numbers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> problem could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> received could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> republics could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> services could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sustain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> welcome could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> west could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> according could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> application could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beneficent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> careful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> competent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> formation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ideas could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intelligent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interference could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mass could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> politics could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proof could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> truly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wishes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> worthy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assurance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consciousness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contrary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> creed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> efficient could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enterprises could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> financial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ideal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> points could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> process could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> raised could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revenues could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sea could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strictly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adapted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> additional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> combinations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enforced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exercised could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tasks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> yes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> although could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> communism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> officer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supposed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> admitted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blessing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enlarged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> kept could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> poor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shores could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vigor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> achievement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ages could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assembled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cherished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> city could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> correct could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> directed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diversity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> energies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fight could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gives could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guaranty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inauguration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inevitable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> noble could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obedience could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> plan could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proceed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> triumph could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> victory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bearing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> broad could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> councils could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deny could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destinies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> divisions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expansion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extraordinary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> favored could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forgotten could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> habits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heaven could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> humbly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inseparable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> institution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> market could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opposition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ordinary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presidential could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pursuit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reflect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seeks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> servants could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surrender could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> theory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thereby could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thousands could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accepted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accomplish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appointment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arbitration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cease could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ceremony could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confidently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> efficiency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> errors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> existed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> father could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gave could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> goal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> house could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ignorance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interfere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intrusted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> judicial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> keeping could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> magistrate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> militia could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> native could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> necessities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> partial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> permitted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> posterity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sources could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weakness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> whenever could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acknowledged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> afforded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anything could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attack could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> behalf could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commitment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concession could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constituted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> effects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entirely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> representative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> statesmen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tribunal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> turning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agencies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emergency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> error could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> everyone could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tendency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> word could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> courts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> islands could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> covenant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recovery could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> texas could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affecting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agricultural could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alliances could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> begun could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> borne could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> calling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forget could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> foundation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invoke could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> judge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> original could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reject could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> utmost could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> administer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> administered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arduous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> asked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> child could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conscious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contemplate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deserve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distinction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> divide could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ends could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faculties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> favorable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hemisphere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> honestly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> largely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> march could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ones could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perils could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> punishment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> raise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sanction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> submit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suggest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> temporary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> threatened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ultimate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> witness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adjustment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anew could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anyone could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> break could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> choose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> climate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compromise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> easy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encouraging could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> examples could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extension could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hostile could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hundred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indispensable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> marked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> middle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mission could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> organized could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> participation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> profit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proposed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protecting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rapid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> read could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reliance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resist could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sacrifices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> safely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seas could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shape could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sovereign could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sphere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> truths could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unnecessary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> violate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> working could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> works could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> address could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> apprehension could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dare could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> despotism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discipline could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discord could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> final could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> founding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gold could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> governed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heritage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hitherto could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> involved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leads could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> master could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> method could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> necessarily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> physical could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> produced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recognition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relieve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sacredly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strife could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> structure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treaties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> violation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> virtuous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> white could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> claims could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enemy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grave could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heroes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inhabitants could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instances could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> jefferson could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> latter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mode could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> near could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occurred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perpetual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possessed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> propose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wants could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> activities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agitation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> british could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> classes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nuclear could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reforms could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respecting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> senator could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stands could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> employees could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proposition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interstate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> actions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ardent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assistance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bestowed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> carrying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> charged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concerned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> daily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> determine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entertained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gather could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grown could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> improve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prayers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prospect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shrink could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> standard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wholly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> absolute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ambition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anticipated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> becomes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> behind could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confident could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> considerations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> current could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disease could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> easily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enjoyment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expense could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fallen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fervent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fidelity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fulfill could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> goodness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hear could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imperative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imposes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lessons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> otherwise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> plain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promotion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prove could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revolutionary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rivers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seemed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> selected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spread could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suffered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sum could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sword could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thoughts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tolerance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ultimately could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> urge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> witnessed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abandon could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accordance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accountability could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> apply could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> count could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deficit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diplomacy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disregard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expedient could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> labors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> length could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> limitation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> motive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> onward could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> properly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reference could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resolution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> securing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> soldiers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> soul could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> steadily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> title could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> verdict could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vote could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adherence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> articles could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assigned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> candid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concerning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> debts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> denied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> derived could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discretion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> element could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> factories could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gift could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> group could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> limit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> loyalty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> minorities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> people's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> productions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promptly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> putting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> record could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remembered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> slave could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> well-being could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> borders could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commission could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compact could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> convention could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> definite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dispute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> effected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expressly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extravagance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> management could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> meantime could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> plainly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promoting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> races could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> realization could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amendments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appears could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fortifications could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> minority could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> railroads could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speedily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suitable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surrendered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> canal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ballot could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> loans could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abiding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> account could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advancing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agree could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anxious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> approach could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> benign could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> capable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> charge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> competition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> debate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> define could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fortunate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inspire could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> insure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> knew could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> laid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lesson could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> line could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opening could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prevail could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proclaim could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quarter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remedies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remove could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restored could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reverence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reward could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solicitude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speaking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strongest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> struggling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> successfully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> swift could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> taught could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> teach could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> three could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undertake could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> walk could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> yield could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> achieved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> armaments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assembly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brave could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conferred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conflicting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conformity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consequence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continuing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destructive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dissolution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> east could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enabled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entertain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exact could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excitement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> executed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fearless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fruitful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heavy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> honored could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> idealism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> illustrious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impressed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> initiative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> insist could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> issues could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mindful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negotiation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neutrality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presented could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quiet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recommendations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recommended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regular could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> render could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resort could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rightful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> satisfactory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scheme could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stop could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supply could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suspicion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> triumphs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> urged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> altogether could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appropriate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arisen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> basic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> calls could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> career could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> convenience could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> counsels could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> demanded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disaster could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disputes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disturbed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> evidence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exclusively could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> farm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fears could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fraternal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> furnish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> giving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guarantees could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> holds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ignorant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> incident could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indian could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> materials could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mercy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> merit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mountains could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> movement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> passions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patriots could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perfection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> principal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prompt could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reasons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repeat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speaker could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spiritual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> submitted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tomorrow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accord could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> applied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> areas could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> available could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> banking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beneficial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compassion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> despair could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dominions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> glorious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> governmental could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heads could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> helpful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> improvements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intention could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neighbor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patriot could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> penalties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> platform could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possessions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> renewal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> retreat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> season could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> similar could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> slightest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preparation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dollar could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speaks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accomplishment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> achievements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> approbation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> author could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> belong could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bitter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bulwark could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cast could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> charity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conclusion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> convictions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> coordinate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> custom could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> death could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decline could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deeper could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distinct could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earnestly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> embrace could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> engage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> firmness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> flow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forefathers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> freemen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gracious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> honesty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> humility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injuries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invested could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> involves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> job could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> magnitude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manifest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> marks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> orderly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> passing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perpetuate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pursuits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reduced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resolved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resource could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> retirement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> roads could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seriously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> size could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spoke could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spoken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> striking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> territorial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transportation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unwilling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> urgent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> virtues could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weakened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abundant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> administrations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affections could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ahead could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> approved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> argument could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arrangement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> atlantic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beauty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> becoming could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> boldly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> boundaries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bright could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> calm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> carefully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conception could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confederation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consequent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constitute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> culture could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decades could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decide could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decisive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> departure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disturb could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> embarrassment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endanger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eternal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expectations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> farms could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fervently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fortunately could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> freely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frontiers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fulfilled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> generosity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grand could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hoped could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indulgence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> influences could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inheritance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injurious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inspired could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instruction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instrumentality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instruments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intentions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interior could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lawful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lifetime could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> looked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> meeting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> midst could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> oppression could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perfectly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> planet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> redemption could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reduction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reflection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> removed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> requisite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rigid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> skill could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spectacle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> storm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strangers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strongly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suffrages could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supervision could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tens could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tried could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> valuable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> varied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wholesome could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wide could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acquisition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> activity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attachment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commencement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constituents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> content could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contribute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> convinced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deliberate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> derive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eastern could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elsewhere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enacted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expenses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fairness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> framed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hopeful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> income could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inspiration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instituted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lights could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> loyal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> meant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> men's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mississippi could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> outset could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> overthrow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> precisely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prefer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pressure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> processes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> purity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> refer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rendered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> righteousness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> schemes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sight could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thereof could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thrift could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unimpaired could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vested could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> watching could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> willingness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agreement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> apparent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> criminal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> essentially could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extensive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> goals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> investigation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> navigation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> particularly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regarded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> river could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sake could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> satisfied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> slaves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wanting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> judiciary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> normal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relationship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> veto could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> productivity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> roman could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abuse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acknowledge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acquiescence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adjust could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aids could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> allowed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> animosities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appointed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> approaching could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arrangements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> associated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assumed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beautiful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bounds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> briefly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bush could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> candor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> celebration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> central could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> choices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> circle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compliance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conducted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confront could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conquered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> controlled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> darkness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dealing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defeat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> delay could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> delayed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> developed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> developing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dictates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> duration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ease could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encouraged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endowed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ensure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> equitable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faces could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> factory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fifty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fitness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> following could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> formidable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fortunes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> foster could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fought could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> governing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> humane could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> immediately could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> immigration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> including could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inflict could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intellectual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lately could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mark could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> menace could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> months could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> night could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> parallel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patient could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pledges could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> portions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possibility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proceeding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prosper could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prudence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> qualities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recall could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remembering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> replace could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reverently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reverse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sanctioned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> search could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> servant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stars could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sufficiently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> superior could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> systems could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tested could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> threaten could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> threatening could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> timeless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> total could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undertaken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unequal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unworthy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> uphold could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> write could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> zealously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abundance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acceptance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> admission could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> admit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adversaries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> allegiance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alliance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ancestors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appoint could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> approval could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attitude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> awful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bounty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brotherhood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> celebrated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> characters could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> charter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commitments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> complex could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conclusive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conquest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consummation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continues could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> creation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> creator could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cross could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deepest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deliberations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> delicate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> desirable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> devised could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> differing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exert could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exhibit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> facility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fairly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fearful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> feature could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> filled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> geographical could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gratifying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hatred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hours could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hunger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inadequate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> infancy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inspires could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> judges could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> judgments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> kindness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> kinds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> law-abiding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leaves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lower could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manufacturers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manufacturing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> masters could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> memory could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> misery could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moderate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mothers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> objections could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occur could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> oppose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ordered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patronage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pecuniary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> performed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> peril could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possibilities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> potential could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> practices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presidency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proclaimed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prominent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> purely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rapidly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recommendation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reign could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rejected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rejoice could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remaining could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> returned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> safer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> saved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seize could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shaken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shield could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> space could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> steady could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strengthening could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> successors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> summoned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supporting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sworn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thirteen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thorough could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thoughtful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> took could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treason could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treatment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tribes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> turned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> twenty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unjust could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> usefulness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vigorous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> votes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> watch could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wisest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> withheld could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> worth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acquired could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> addition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aims could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alarm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> augmented could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> capitol could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collisions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comforts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confederated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> corruption could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elective could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> engagements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> escape could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exclusive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excuse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expanded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> framers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> front could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> going could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> government's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hereafter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> highly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> implied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instrumentalities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> jealousies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> listen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negligence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obtain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paper could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> peculiarly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protective could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regulation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resorted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> savings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sincerely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> specie could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> streets could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treasure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trusted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> twenty-five could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> upward could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> warfare could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> workers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> budget could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> civility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> controlling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> delegated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> district could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> examination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hardly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> isthmus could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> monetary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proven could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> qualifications could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clause could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conceive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> houses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> incoming could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> major could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> operations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> philippines could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revision could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ships could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abandoned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abilities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aboriginal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> absence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> active could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> administrative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> allow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amidst could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anniversary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> announce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arrest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> asia could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aside could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assert could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attainment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attempts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> authorized could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> await could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> awaits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> barriers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> church could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cold could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collective could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> colored could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> communication could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> completed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conscientious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cordial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> corrected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> corresponding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> creating could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dealings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> declarations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> demonstrated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deserves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deserving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> devote could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> displayed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> domain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dread could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eight could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enlarge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> environment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exception could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exertions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exhibited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> experienced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expressing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> facing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fault could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fitting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fullness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gifts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> goes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> harmonious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> helping could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hungry could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> image could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imperatively could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inestimable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interested could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invariably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invoking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> isolation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> jealous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> joined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> justify could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> knows could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> laboring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> largest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> later could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leaving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> magnificent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mandate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> marched could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mistake could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> momentous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> morality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> names could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> noblest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> overwhelming could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> partisanship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> permitting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pleasure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> plenty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> potent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> precise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pressing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prevented could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> programs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prudent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> questioned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rank could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> really could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repeated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reposed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restraints could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resulting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revealed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rightfully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rising could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> risk could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ruin could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ruler could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rulers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> safeguard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> safeguards could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> salutary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scope could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> servitude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> slow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> smaller could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sorrow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speedy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> splendid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> start could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> summon could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supplications could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suppression could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> survive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sympathies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> threatens could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tide could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> to-day could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tradition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> traditions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transactions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transfer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transmit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tremendous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unlimited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unmindful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> valley could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> venture could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vicissitudes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vitality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> voluntary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> watchful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wonderful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> worst could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> zealous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accession could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adjusted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adverse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ambitions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amply could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> animates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> annual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appeals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appointments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aspect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> association could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attainments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> avoided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> besides could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> birthright could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> black could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blind could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bodies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bosom could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brethren could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> center could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> children's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> competency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contains could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contribution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> controversy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> corporations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> correction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> courses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dawn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decay could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defenses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dependence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> died could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disbursement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distributed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> doubts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> draw could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> driven could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earlier could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earliest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> economical could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> edge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emancipation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> estimate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extinguished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fabric could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> farmers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fields could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> foe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frame could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frankly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> freed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> funds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> furnished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> genuine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grows could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guaranties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hatreds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> head could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> honorably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impartial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> improved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indebted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indicated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inspiring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invites could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> joint could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> justification could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> key could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> kindly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> marvelous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> metals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> misunderstanding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> morals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> movements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nationality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> overcome could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> parent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> passage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paths could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ports could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preparing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pretense could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pretext could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> probably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proofs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regret could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regulated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> republicans could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resumption could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revived could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> righteous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seaboard could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> secures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seldom could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> simply could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> springs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> star could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stopped could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strange could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> subordinate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suggestions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suppose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> temple could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tendencies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> today's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transferred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trusting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> uncertainty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undiminished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> uniform could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unmistakable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> utter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> veneration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vicious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wave could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> youth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affirm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aggregate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anarchy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> apprehensions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ashamed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> believes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bills could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brothers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> characterize could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> claimed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> coin could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> columbia could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comprehend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confided could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contract could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deficiency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dependent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> designed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> domination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> drive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> drugs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> federative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> food could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gladly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> illegal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> introduced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> matured could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mistakes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neutral could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ownership could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> precedent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pretensions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> procedure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> removal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rightly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> satisfying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scientific could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> secondary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unlawful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unprecedented could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wrought could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> colonies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concluded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> door could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enactment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lawfully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> majorities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negroes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occasionally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occurrences could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> philosophy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pleasing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preceding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regards could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> statutes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> whatsoever could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> breeze could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cuba could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eighteenth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 1787 could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abandonment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adhere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> admiration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> admonition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advances could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> apart could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appeared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appointing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> area could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> art could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assumes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> avoiding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> awakened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aware could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beliefs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> believing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> belonging could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bestow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> binding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bond could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> broader could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> broken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cabinet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> calmly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> canals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> chains could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> challenged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> changing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> chapter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> chiefly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> chorus could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clarify could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> closed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> closely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> combat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compatible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compelled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compensation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concessions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conciliation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concord could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> condemn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conducting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conflicts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confusion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conservative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consistently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consolation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contempt could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contentment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contests could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contrast could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contributions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cooperate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> creative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> crises could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cultivated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> customs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dead could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dedicate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dedicated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> definition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> demonstrate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> demoralizing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> depart could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deprived could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destroyed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> develop could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> devise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diffusion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diminish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discovered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discrimination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discussions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dissolve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distress could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distribution could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dreaded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> durable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> economically could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> educated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elapsed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elevated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> embracing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emerged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emergencies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eminently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emphatically could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endurance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enhanced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enjoins could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enlargement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> entangling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> equivalent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> establishing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eventful could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eventually could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> evident could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exchanged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exclude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exercising could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exposed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eye could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> failures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> far-reaching could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> favorably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> features could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fighting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> finance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> finances could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> finds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> firmest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> firmly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> five could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forests could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fortune could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fraught could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frequent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gallant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> george could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> glad could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> global could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> golden could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> groups could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> habit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> halls could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> harbors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hardship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> harness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> height could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heirs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hesitation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> highways could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hostility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> identified could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impairing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impartiality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impunity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> incorporated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> individually could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> induction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inevitably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inferior could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inherent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> investment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inviolate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> iron could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> keeps could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> liberality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> liberate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> limitless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> looks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> louisiana could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> low could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> majesty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mall could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manifestation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> masses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> match could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> memories could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mental could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mischief could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mistrust could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mockery could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> model could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> modes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moreover could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mother could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> multiplied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> municipal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> necessaries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neighborhood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nobility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> nowhere could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obscure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obstacles could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occasions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occupy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> openly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> opposing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> oppressed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> origin could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> outline could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> overruling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> owe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paramount could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> patience could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> payment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> performing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> periods could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> petty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pleased could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> positive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> practiced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prescribe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prevailed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prevails could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> primary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> profitable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> profligacy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> progressive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protector could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> province could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> purchase could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pursuing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> raising could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rarely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reaching could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reckless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reducing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reflecting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> registered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regulate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rejoicing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remarkable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repair could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repeal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restoring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restraint could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resulted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> retain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reverend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> review could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> riches could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> room could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sanctity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sanguine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> satisfy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scattered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scene could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scrupulous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> secret could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seeing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sees could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> selection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> separated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sights could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> signally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sincerity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sober could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> societies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solemnity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solemnly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sovereignties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> specific could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spheres could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stages could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stake could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strike could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> striving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> study could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> submission could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> substance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> substantial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> substitute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> succeeding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> successive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suggested could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> summons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supplying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surface could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> susceptible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> systematic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> takes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tempered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> temptation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thanks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> therein could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tolerated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> town could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tribunals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> troops could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> troubled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> troubles could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trusts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> turmoil could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unavoidable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unborn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> uncertain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undertaking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> universe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unknown could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> upheld could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> useless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> utterly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> variety could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vigilance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vigilant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wages could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wait could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> warrant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> watched could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> waterways could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wicked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> widespread could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> winds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wonder could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> worked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> worship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wounds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 1789 could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accepting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> actually could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> administering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> affectionate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aimed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alleged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> allotted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> animated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> answered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anticipate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anxiously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appreciation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arsenals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assertion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bigger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> britain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cheering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clinton could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> co-operation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commanded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commonwealth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comparative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comparatively could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> comprehensive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> congratulate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consequently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conservation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constitutionally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constitutions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contemplation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contracted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> controls could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> counter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> currents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deeds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> delivered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> despite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diffidence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dominion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> doors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> doubted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earthly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> effectual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> electoral could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> embarrassments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> employ could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encountered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> engineers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enhance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excessive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exchange could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> feet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fertile could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> finished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forebears could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fraternity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> get could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> goods could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> grim could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guardianship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guarding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> harm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> haste could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hasty could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> holding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> illiteracy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imperialism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> incompatible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injunctions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inland could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inquiry could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> insistence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intolerance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intrigue could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invasions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> island could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> joy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> justified could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> leader could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lessen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> letter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> likewise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lincoln could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manhood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> measured could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negotiate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obey could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obtained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offensive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> operate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> organic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> outside could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> page could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> partiality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> participate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paternalism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> payments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perpetuity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possession could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> railways could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> readjustment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> receipts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recurrence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reflected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reflects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reformation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relationships could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reminded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repealed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> report could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> represent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repugnant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> requirements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reservations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respectable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respectively could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> respond could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> retrospect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> returning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> route could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> says could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sinister could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sister could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> so-called could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> soldier could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> souls could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speculative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> statute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stranger could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> subjected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supremacy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> symbol could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> temper could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> terminated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> timid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> traditional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> traveled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unanimity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unwisely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> usage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> valor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> victories could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vigorously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wherein could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 20th could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 21st could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acquiesce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aliens could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amongst could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> board could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> breath could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ceded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> convene could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> crucial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dependencies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discriminating could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discriminations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dissensions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> electors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> engagement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fifteenth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> incidental could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intimate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lawless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legislatures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> list could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mandates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> marine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> merchant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> neighboring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> officials could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paint could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> paying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presidents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> related could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reorganization could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reports could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> revival could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> selfishness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> separation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> silver could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> song could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suggestion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> summary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unshaken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> voters could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weapon could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> westward could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aristocracy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compromises could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lock could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remark could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> represents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> secede could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 1776 could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abraham could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> absolutely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> abundantly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> access could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accessible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accompanied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accomplishing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> accumulation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> addressed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> adequately could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advantageous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advocated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aegis could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> afraid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> agent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aggrandizement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alarmed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alert could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alien could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> allows could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alluring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> alter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> americas could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> amicable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anchor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> angels could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anticipation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> anxieties could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> appreciate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> approve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> april could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ardor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arguments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arises could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> arising could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> artificial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ascertained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> asks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aspiration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> aspire could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assemblage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> associates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> assuming could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attached could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attachments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attacks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attempted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> attributes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> august could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> auspices could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> authors could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> auxiliaries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> avert could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> balanced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> banished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bank could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> base could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bears could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beg could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> begets could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beginnings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beneath could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> benediction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beneficence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> beset could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> betray could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bigotry could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> binds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bitterness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blinded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bloodshed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> boasted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bridges could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> brilliant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bringing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> burdened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> businesses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> calculation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> campaign could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> candidly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> carries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ceased could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> centers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> channels could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> checks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> civic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> civil-service could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clean could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> clergy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collapse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> collectively could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> colleges could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> color could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> combined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commanding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commencing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> communications could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compass could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compelling could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> completely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> complicated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> composed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conceded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conceived could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concurrence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> condemned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confirmed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> congressional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> connection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conquer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consecrate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> considerable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> considerate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> considering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conspicuous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conspicuously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constructed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consumed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> continuation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> corner could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> correspondent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> costs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> countenance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> courageously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> covet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> credits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> creeds could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> crowded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> crowned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cultivation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cultural could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cured could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> darkened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> declining could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decrees could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deficiencies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deliberation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deliver could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> democrats could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> demonstration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dependency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> depending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> derives could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> descendants could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deserts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> desired could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> destroying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> detail could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> detriment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dictate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> differ could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dignified could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diminishing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disappeared could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disappointed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discern could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discharged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disciplined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discordant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> discouragement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disinterested could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dispelled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disregarded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> distressed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disunion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diversified could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> documents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dreamed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> drift could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dwell could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earned could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> easier could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> effectively could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> elevation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> embraced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eminence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emotions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emphatic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enact could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encounter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> encourages could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endured could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enriched could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> essence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> establishments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> evade could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> eve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exactions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exceeding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excellence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exempt could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exerted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exigency could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expand could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exploits could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> expose could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> exposition could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extinguishment could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extreme could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> faiths could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> falls could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fascism could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> felicity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fires could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fiscal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> flame could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> flames could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> follows could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> footing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forbidding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> forebodings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fostering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fourth could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fragile could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> framework could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frank could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fraud could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> french could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fresh could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fullest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> furnishes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gaining could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gathered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gathering could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> girl could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> god-given could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gratefully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gratification could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guests could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hang could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> hasten could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heartily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> heedless could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> housing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> idealistic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> idle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> illustrated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imagine could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> immense could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> immigrants could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imperfect could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> import could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imports could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imposing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> imposts could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impotent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impoverished could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impressive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inalienable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inaugural could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inaugurate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inclination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> include could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> included could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indians could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indicating could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indirectly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> induce could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> industrious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inexhaustible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> informed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inherited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injure could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> injuring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> instrumental could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intends could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interpretation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intricate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inviolable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> invited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> irrevocably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> jealousy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> killed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> knowingly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lack could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lacking could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lash could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> launched could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> learning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> legions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> levels could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> liberated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lifted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lighted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lighten could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> livelihood could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lover could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> loving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> luxuries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> machinery could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> majestic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> manly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maxim could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> meager could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> menaced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> menacing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> message could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mild could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> millennium could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> million could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> minister could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> minor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mitigate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moderation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> modification could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> monroe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mortal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mutually could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> naturalization could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> navies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negotiations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> numerous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> objection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> objective could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occasional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occupations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> oceans could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> older could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> oppress could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ordained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> originate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> outlines could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pace could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> parents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pause could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> peaceably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perfected could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> perish could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> permanently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> persistent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> phrases could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pity could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> plains could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> planted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> positions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possesses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> possessing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> post could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> postponed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> practically could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preceded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> precept could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> precision could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preeminently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prepare could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prescribes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> previous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> primarily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> privileged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> probable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> product could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prohibit could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prohibited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> projects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> promised could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prompted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prospered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> protects could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proudly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> purified could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quicken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quickly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> racial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> raging could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ranks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> realities could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> realizing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reasonably could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reborn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rebuilding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recognizing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reconstruction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recourse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> recur could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reelection could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> referred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> refused could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> refusing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> region could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reiterate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reluctance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remarks could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remedied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remembrance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remind could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> remote could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> removing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reputation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> requirement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> research could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> resolutely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> responsibly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restrain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> restrained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> retained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> returns could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> risen could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rock could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sacrificed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> salute could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sanctions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> saving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scale could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> school could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> scourge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> searching could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> self-reliance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> send could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sensed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sensibility could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sensible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> settle could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> settlements could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> settlers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> severe could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shadows could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shaping could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sheet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shop could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shortly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shoulders could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shows could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> shuttered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> signs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sky could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> slowly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> solid could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> somewhat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speculation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speech could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spreading could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> staked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> statement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> statesmanship could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> status could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stay could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strictest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> struggles could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> subordination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sudden could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suited could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> supplement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> suppressed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surmount could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surpassed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> surround could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> survival could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> survived could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sustaining could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> swear could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sweat could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> talent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> technological could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tells could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> temperance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tempest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> terminate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> termination could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thomas could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thoughtfully could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> threshold could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thrive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> throwing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tolerate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> toleration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> tonnage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> torn could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> totally could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> touch could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> traced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trained could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transmitted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> travel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> treasures could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> turns could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unconquerable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unconstitutional could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undermines could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undisturbed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> undoubted could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unexampled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unfortunate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unique could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unmatched could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unparalleled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unreserved could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unto could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unused could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unusual could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unwise could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> using could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> usually could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> usurpation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> valued could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> variance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vastly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> venerated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vessels could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> victims could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> virginia could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> voluntarily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> volunteer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vulnerable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wander could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> warm could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> warmly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> watchfulness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weigh could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> went could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> widely could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> widened could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wild could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> witnesses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> woman could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> won could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wounded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wronged could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wrongs could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> yielding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 200 could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> 200th could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> acquisitions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advantageously could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> advisable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> angel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> annoyance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> applying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> band could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> begins could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> believers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> belligerent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> benevolence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> boundary could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bow could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> box could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> bridge could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> captives could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> caused could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> census could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> circulation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> circumstance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> closer could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> coined could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commenced could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> commended could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compare could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> compete could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> concept could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> conference could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> confiding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consecration could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consists could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> constructive could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consultations could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> consumption could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> contention could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cooperative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> corrupting could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cotton could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> covenants could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> covers could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> cruel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> debates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> decree could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> defines could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> denial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deprecated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> deprivation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> details could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> diplomatic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disposal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disruption could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dominant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> earnings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> electorate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> emancipated could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> embody could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> endangered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> england could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> enormous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> especial could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> esteem could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> excluded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> experiments could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> explain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> explore could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> extra could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fast could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fatal could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> feasible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fisheries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fix could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fixing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fortitude could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> fostered could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frankness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> freedom's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> friendliness could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frontier could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> furnace could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> furtherance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gaze could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gradually could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guaranteed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> guarded could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> gulf could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> horizons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> immutable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> impressions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> increasingly could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inculcate could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indicates could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> indications could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> inflation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> insignificance could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interdependence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> interpret could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intervention could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> intolerant could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> irresponsible could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> kindred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> king could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lapse could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> letters could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> lowest could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maimed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maintains could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mariners could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> maximum could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mechanic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mining could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> misconstruction could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> miseries could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> moon could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mountain could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> music could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> named could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> negative could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> occupation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offense could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offspring could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> overlooked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> partake could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> pathway could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> permanence could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> picture could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> postponement could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> predictions could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> preference could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presently could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> presumed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> prisoners could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> proportion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> propriety could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> providential could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> quite could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> ratification could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> readily could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> redress could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> refreshed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> regarding could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> relies could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> renewing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> repel could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reserve could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> retire could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reviewed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sagacious could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> savage could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> seasons could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> serves could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> serving could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> silent could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> singular could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> skills could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> soviet could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> span could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> species could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> speeches could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> spending could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stagnation could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stock could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> storms could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> sufferings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> table could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> taxing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> technology could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thee could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> thrives could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> trend could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unalienable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unanimous could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> understandings could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> unsettled could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> upright could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> vietnam could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> void could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> waters could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weaker could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wealthy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> weighed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> wills could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> winning could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> winter could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> antitrust could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> array could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> blowing could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> checked could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> criminals could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> disputed could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> dissatisfied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> domingo could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> familiar could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> frugality could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> incumbents could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> levying could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> liquor could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> mastery could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> metallic could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> micah could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> monarchy could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> notes could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> obama could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> observable could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> offenses could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> other's could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> reunion could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> rhetoric could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> santo could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stirred could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> stricken could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> strives could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> studied could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> technical could not be fit on page. It will not be plotted.
#> Warning in wordcloud(term, count, random.order = FALSE, scale = c(6, 0.5)):
#> transit could not be fit on page. It will not be plotted.
```

![plot of chunk unnamed-chunk-5](patrick-unnamed-chunk-5-1.png)


## Relative to Google 1-grams


```r
x <- rowSums(google1grams)
i <- match(stats$term, names(x))
stats$google <- x[i]
stats$ratio  <- with(stats, count / google)
print(stats)
#>    term  count support      google        ratio
#> 1  the   10082      58 47229595404 2.134678e-07
#> 2  of     7103      58 30583877751 2.322465e-07
#> 3  and    5310      58 21967428644 2.417215e-07
#> 4  to     4526      58 18921974620 2.391928e-07
#> 5  in     2785      58 15180655265 1.834572e-07
#> 6  that   1789      58  7710003808 2.320362e-07
#> 7  be     1481      58  4765600159 3.107688e-07
#> 8  it     1389      58  4389244745 3.164554e-07
#> 9  for    1197      58  6028354614 1.985616e-07
#> 10 by     1083      58  4482090719 2.416283e-07
#> 11 have   1011      58  2735579640 3.695743e-07
#> 12 this    835      58  2833482645 2.946904e-07
#> 13 all     819      58  1851969458 4.422319e-07
#> 14 are     814      58  3643287867 2.234246e-07
#> 15 has     622      58  1617279945 3.845964e-07
#> 16 a      2246      57          NA           NA
#> 17 our    2181      57   791200906 2.756569e-06
#> 18 we     1739      57  1545865753 1.124936e-06
#> 19 is     1462      57  8257152905 1.770586e-07
#> 20 with    958      57  4992239290 1.918979e-07
#> 21 not     957      57  4402202193 2.173912e-07
#> 22 as      947      57  5234581099 1.809123e-07
#> 23 i       838      57   136947084 6.119152e-06
#> 24 but     654      57  2090848491 3.127917e-07
#> 25 from    572      57  3291978530 1.737557e-07
#> 26 an      390      57  2525437349 1.544287e-07
#> 27 so      388      57  1275520098 3.041896e-07
#> 28 which  1006      56  3097452143 3.247831e-07
#> 29 will    911      56  1442386356 6.315922e-07
#> 30 their   753      56  2060194528 3.654995e-07
#> ⋮                             (9343 rows total)
```

Order by ratio


```r
reorder(stats, desc = ratio)
#>    term        count support google       ratio
#> 1  stennis         1       1     21 0.047619048
#> 2  belleau         1       1     48 0.020833333
#> 3  argonne         2       2    100 0.020000000
#> 4  guadalcanal     1       1     68 0.014705882
#> 5  bernardin       1       1     82 0.012195122
#> 6  goethals        1       1     87 0.011494253
#> 7  salerno         1       1    214 0.004672897
#> 8  mondale         1       1    218 0.004587156
#> 9  micah           3       1    675 0.004444444
#> 10 dingley         2       1    482 0.004149378
#> 11 dirksen         1       1    254 0.003937008
#> 12 dakotas         1       1    266 0.003759398
#> 13 macleish        1       1    281 0.003558719
#> 14 yorktown        2       2    604 0.003311258
#> 15 obama           3       1   1223 0.002452984
#> 16 arlington       2       2    818 0.002444988
#> 17 americans      74      21  30334 0.002439507
#> 18 america       184      30  91568 0.002009436
#> 19 gettysburg      2       2   1034 0.001934236
#> 20 cubans          1       1    548 0.001824818
#> 21 scandinavia     1       1    644 0.001552795
#> 22 philippines     6       2   3991 0.001503383
#> 23 hatfield        1       1    669 0.001494768
#> 24 gillis          1       1    677 0.001477105
#> 25 biden           1       1    700 0.001428571
#> 26 monticello      1       1    700 0.001428571
#> 27 delano          1       1    723 0.001383126
#> 28 sumter          1       1    754 0.001326260
#> 29 archibald       1       1    791 0.001264223
#> 30 quayle          1       1    826 0.001210654
#> ⋮                             (9343 rows total)
```

Threshold count


```r
(subset(stats, count >= 5)
 %>% reorder(desc = ratio))
#>    term        count support   google        ratio
#> 1  americans      74      21    30334 2.439507e-03
#> 2  america       184      30    91568 2.009436e-03
#> 3  philippines     6       2     3991 1.503383e-03
#> 4  mississippi     7       5     8853 7.906924e-04
#> 5  american      163      45   213155 7.647017e-04
#> 6  cannot         56      22    82627 6.777446e-04
#> 7  washington     23      16    35844 6.416695e-04
#> 8  columbia        5       3    11155 4.482295e-04
#> 9  jefferson      10       6    24857 4.023012e-04
#> 10 europe         19      11    56175 3.382287e-04
#> 11 spain           6       2    20139 2.979294e-04
#> 12 texas          11       2    38801 2.834978e-04
#> 13 cuba            5       1    18029 2.773310e-04
#> 14 european       14       7    91362 1.532366e-04
#> 15 atlantic        7       6    47497 1.473777e-04
#> 16 british        10       5    97272 1.028045e-04
#> 17 asia            5       5    51792 9.654001e-05
#> 18 mr             31      12   663655 4.671102e-05
#> 19 indian          8       6   201301 3.974148e-05
#> 20 federative      5       3   138013 3.622847e-05
#> 21 almighty       29      25   904324 3.206815e-05
#> 22 guaranties      5       4   211965 2.358880e-05
#> 23 congress      130      29  5807525 2.238475e-05
#> 24 confederacy    19       8  1406543 1.350830e-05
#> 25 guaranty       11      10   873641 1.259098e-05
#> 26 pacific        13       9  1184827 1.097207e-05
#> 27 amity           9       6   896612 1.003779e-05
#> 28 hatreds         5       4   510608 9.792248e-06
#> 29 united        202      47 21223302 9.517840e-06
#> 30 forbearance    14       9  1582693 8.845683e-06
#> ⋮                                (2705 rows total)
```

## Another wordcloud


```r
top <- (subset(stats, count >= 5)
        %>% reorder(desc = ratio))[1:300, ]
with(top, wordcloud(term, ratio, random.order = FALSE,
                    scale = c(10, .5)))
```

![plot of chunk unnamed-chunk-9](patrick-unnamed-chunk-9-1.png)
