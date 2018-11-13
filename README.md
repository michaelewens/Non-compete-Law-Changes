# Incorporate non-compete law changes from Ewens and Marx (2017, RFS)

Ewens and Marx (2017) use a series of state-level law changes in the U.S. from 1995--2016 to study the impact of founder replacement on startup outcomes.  

## CSV file

Coming soon.  The csv file has three variables: `state`, `cncChange` and `year` defined as:
* `state`: two-letter abbreviation of state
* `cncChange`: -1 or 1 which represents the incremental change in the strength of the law change.  -1 indicates a weakening, 1 indicates a strengthening, relative to the previous year.
* `year`: the year of the law change.  The best year to assume is _treated_ are years after this year.

## Stata code

[The do file](createCNCvariables.do) can be run in any program as `do createCNCvariables.do` after you update the two global variables in the file.  The simple file creates the variable `lawChangeYear` and `cncChange` for state-years with non-compete law changes.   See above for variable definitions.

## R code

Coming soon.

## Python code

Coming soon.

## Citation

`@article{ewensMarx2017founder,
  title={Founder replacement and startup performance},
  author={Ewens, Michael and Marx, Matt},
  journal={The Review of Financial Studies},
  volume={31},
  number={4},
  pages={1532--1565},
  year={2017},
  publisher={Oxford University Press}
}`

Ewens, Michael, and Matt Marx. "Founder replacement and startup performance." The Review of Financial Studies 31.4 (2017): 1532-1565.
