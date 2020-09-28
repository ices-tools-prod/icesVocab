## Test environments
* Windows 10 x64 (build 19041), 4.0.2 (2020-06-22)
* ubuntu 16.04.6 (on travis-ci), 4.0.2 (2020-06-22)
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* checking CRAN incoming feasibility ... Note_to_CRAN_maintainers
Maintainer: 'Colin Millar <colin.millar@ices.dk>'

** running examples for arch 'i386' ... [12s] NOTE
Examples with CPU (user + system) or elapsed time > 10s
           user system elapsed
findAphia 10.22   0.06    11.5
** running examples for arch 'x64' ... [12s] NOTE
Examples with CPU (user + system) or elapsed time > 10s
           user system elapsed
findAphia 10.64   0.05   11.81

## Notes

Fixed bug in xml parsing

## Reverse dependencies

icesSAG
icesDatras
