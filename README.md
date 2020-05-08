
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {badgr}

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
<!-- badges: end -->

The goal of {badgr} is to use R to generate URL endpoints for
[shields.io](https://shields.io/) metadata badges that you can use in
your repository’s README file or elsewhere.

I’m not affiliated with the excellent [shields.io](https://shields.io/).

You can [back or donate to
shields.io](https://opencollective.com/shields). Find out more from
their:

  - [website](https://shields.io/)
  - [Twitter](https://twitter.com/Shields_io)
  - [Discord](https://discord.com/invite/HjJCwm5)
  - [source code](https://github.com/badges/shields)

## Installation

You can install {badgr} from GitHub with:

``` r
remotes::install_github("matt-dray/badgr")
```

It’s a work in progress and there are no guarantees.

## Examples

### Simple

This is a basic example that shows you how to generate the simplest
possible badge.

``` r
library(badgr)

badge <- get_badge(
  "Left bit", "Right bit", "blue",
  to_clipboard = FALSE,  # don't copy to clipboard
  open_browser = FALSE  # don't send to browser
)
```

The output looks like this:

``` r
badge
#> [1] "![](https://img.shields.io/badge/Left_bit-Right_bit-blue?style=flat&logo=)"
```

Which when rendered, looks like this:

![](https://img.shields.io/badge/Left_bit-Right_bit-blue?style=flat)

### More complex

Let’s use a few more arguments.

``` r
badge2 <- get_badge(
  label = "Left bit",
  message = "Right bit",
  color = "red",
  style = "for-the-badge",
  label_color = "blue",
  link_left = "https://rstudio.com/",
  link_right = "https://shields.io",
  logo_simple = "rstudio",
  logo_color = "white",
  logo_width = 20,
  open_browser = FALSE,
  include_md = TRUE,
  to_clipboard = FALSE
)

badge2
#> [1] "![](https://img.shields.io/badge/Left_bit-Right_bit-red?style=for-the-badge&labelColor=blue&link=https://rstudio.com/&link=https://shields.io&logo=rstudio&logoColor=white&logoWidth=20)"
```

Which looks like
this:

![](https://img.shields.io/badge/Left_bit-Right_bit-red?style=for-the-badge&labelColor=blue&link=https://rstudio.com/&link=https://shields.io&logo=rstudio&logoColor=white&logoWidth=20)

## Code of Conduct

Please note that the {badgr} project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
