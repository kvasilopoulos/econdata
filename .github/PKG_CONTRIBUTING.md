Follow these 4 simple steps:

1) Store the initial file 

* Navigate to `data-raw`.
* Create a new folder with name the same as the bibkey.
* In the new folder place the dataset in the raw format.

2) Store it as data in the package

* Go back to `data-raw/papers.R`.
* Read, manipulate and store the dataset with the `usethis::use_data()` function.

3) Create a bib entry

* Navigate again `data-raw/...bib/papers.bib`
* Create a new entry to `papers.bib`
* Then ource `data-raw/...bib/create_bib.R`

4) Document the dataset

* Navigate into `R/datasets-papers.R`
* Add the below command chunk above the the name of the dataset

```
#' @template rox_papers
#' @templateVar key "PAPER_KEY"
```

# NOTE

The name of the dataset (and the bibtexkey) should be the initials of the authors
followed by the date of the publication. For examples `Stock and Watson 2001` should be `sw2001`.
