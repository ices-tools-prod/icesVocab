## Test environments
* Windows 10 x64 (build 19041), 4.0.3 (2020-10-10)
* ubuntu 16.04.6 (on travis-ci), 4.0.2 (2020-06-22)
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* checking CRAN incoming feasibility ... Note_to_CRAN_maintainers
Maintainer: 'Colin Millar <colin.millar@ices.dk>'

CRAN repository db overrides:
  X-CRAN-Comment: Archived on 2020-10-11 for policy violation

## Notes

Vocabulary code Keys are always characters. There were two issues fixed:
1. The Key column was being converted via type.convert - which yeileded
  different return types - now fixed
2. some systems seem to be returning NULL when a column from a zero row
  data.frame is accessed. Can't fully confirm this, but am not relying
  on this anymore in anycase.

## Reverse dependencies

icesSAG
icesDatras
