## Test environments
* local R installation, R 4.0.2
* ubuntu 16.04 (on travis-ci), R 4.0.0
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Colin Millar <colin.millar@ices.dk>'

New submission

Package was archived on CRAN

Version contains large components (1.1.4.9000)

Non-FOSS package license (file LICENSE)

Possibly mis-spelled words in DESCRIPTION:
  RECO (8:40)

## Notes

previous version had an example which access the internet and was not
fixed in time, so package was archived, this has been set to dont run.

## Reverse dependencies

icesSAG
icesDatras
