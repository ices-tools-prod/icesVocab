## Test environments
* local R installation, 4.0.2 (2020-06-22)
* ubuntu 16.04.6 (on travis-ci), 4.0.2 (2020-06-22)
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Colin Millar <colin.millar@ices.dk>'

New submission

Package was archived on CRAN

Possibly mis-spelled words in DESCRIPTION:
  RECO (8:40)

## Notes

Previous version had an example which errored this has been amended to
fail gracefully.  other examples set to donttest to save time in
building and checking.

## Reverse dependencies

icesSAG
icesDatras
