# Contributing Guidelines

Want to help make `healthcareai` better? Great! Here are some ideas and guidelines for how you can get involved.

## Feature Requests and Bug Reports

The easiest way to contribute to making `healthcareai` better is to provide feedback about what you want the package to do and what it isn't doing well. 

Both feature requests and bug reports should be submitted as [Github issues](https://github.com/HealthCatalyst/healthcareai-r/issues). 

**Bug reports** should be filed with a [minimal reproducable example](https://gist.github.com/hadley/270442). The [reprex package](https://github.com/tidyverse/reprex) is extraordinarily helpful for this. Please also include the output of `sessionInfo()` or better yet, `devtools::session_info()`.

## Writing Code and Documentation

We welcome contributions from within and beyond the Health Catalyst community. To get involved, [fork the repository](https://help.github.com/articles/fork-a-repo/), create a topic branch, make changes, and submit a [pull request](https://github.com/HealthCatalyst/healthcareai-r/pulls).

#### Pull Request Checklist

When submitting a pull request, here's what you need to check. Some of these things should be done iteratively during the development process, especially building the documentation, building the package, and running tests. To speed up testing during development, you can run a subset of tests with `devtools::test(filter = "predict")`. Some of these things will be tested by continuous integration, others will not, so please be sure to run through this list.

- [ ] Pull the current remote master branch and ensure your branch is up to date: `git checkout master; git pull; git checkout feature_branch; git merge master`
- [ ] Generate package documentation: `devtools::document()`
- [ ] Build package: `devtools::build()`
- [ ] Ensure any code you've added is well tested. A coverage report will automatically be added to the PR. You can get a sense of coverage by running `covr::package_coverage()`
- [ ] Ensure code is lint free: `lintr::lint_package()`. This will also be checked in tests...
- [ ] Ensure code passes all tests: `devtools::test()`. This will also be checked in check... 
- [ ] Ensure code passes all CRAN checks without warnings or notes: `devtools::check()` 
  - If you get NOTEs about global variables with no visible binding for variables defined via NSE (e.g. in dplyr functions), add them to the list of `globalVariables` in `R/globals.R`.
- Do not regenerate the pkgdown website. We will rebuild this for every minor release when a new version of the package is on its way to CRAN.

#### Getting Started Contributing

It's best to start small and work your way into deeper issues as you gain familiarity with the process. Improvements to documentation are a great place to start. We also tag issues that we think make good opportunities for contributions with the ["help wanted" tag](https://github.com/HealthCatalyst/healthcareai-r/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22).

## Repository structure

This repository is structured as a standard R package. Hadley's [R Packages](http://r-pkgs.had.co.nz/) is an excellent resource on package authoring details and conventions.

All code is found in `R/`, and documentation is written via [roxygen2](https://github.com/klutometis/roxygen) with the function definition. Exported functions generally get their own file, and helper functions go below the function that calls them or in `R/utilities.R` if they are called by multiple functions. Tests are in `tests/testthat/`.

## Documentation

All of the function documentation is generated automatically. Do not edit any files in `man/`, `docs/`, or `NAMESPACE`. Instead, construct the appropriate [roxygen2](http://r-pkgs.had.co.nz/man.html) documentation in the
function files in `R/` themselves. Documentation should be generated before issuing a pull request by running `devtools::document()` (shift-command-R in RStudio).

## Testing

Any new code should include a unit-test demonstrating the change. We subscribe to [test-driven development](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd), which suggests starting by writing a now-failing test that describes the functionality or bug fix you want to implement.

Tests are implemented via `testthat` and are located in `tests/testthat/`. All tests must pass before a pull request can be merged; you can check that this is the case by running `devtools::test()`. This will also check your package for code style. 

The package uses [codecov.io](https://codecov.io/) to measure test coverage. Try to avoid decreasing coverage by writing unit tests for any contributed code. codecov.io will flag PRs that decrease coverage. 

## Code Style

Code should conform to the [tidyverse style guide](http://style.tidyverse.org/). Code style will be checked in your pull request by [lintr](https://github.com/jimhester/lintr), and tests will fail on Travis if there are lints. You can check conformation with the style guide by running `lintr::lint_package()` locally.

## Adding Algorithms

When adding support for a new algorithm, these are some spots you'll need to address. There are likely to be others as well depending on details of the algorithm, but these should diminish as more algorithms are implemented. 

- In models.R
    - `translate_model_names`: Add caret's name and ours
    - `get_supported_models`: Add our name
        - Update @description with hyperparameters
- In setup_hyperparameters.R
    - `get_hyperparameter_defaults`
        - Update @details
    - `get_random_hyperparameters`
- In tune_models.R: @importFrom the library(ies) caret calls to fit the model. 
- Tests: See what fails and update them accordingly

---
Thanks to the well-organized rOpenSci [codemetar](https://github.com/ropensci/codemetar) and [drake](https://github.com/ropensci/drake) packages, which were drawn on heavily in the creation of this document.
