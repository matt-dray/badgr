
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

You can [donate to or back
shields.io](https://opencollective.com/shields) and can find out more
from their:

  - [website](https://shields.io/)
  - [Twitter](https://twitter.com/Shields_io)
  - [Discord](https://discord.com/invite/HjJCwm5)
  - [source code](https://github.com/badges/shields)

## Installation

You can install {badgr} from GitHub with:

``` r
remotes::install_github("matt-dray/badgr")
#> Using github PAT from envvar GITHUB_PAT
#> Skipping install of 'badgr' from a github remote, the SHA1 (ec172d7e) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

It’s a work in progress and there are no guarantees.

## Example

This is a basic example that shows you how to generate the simplest
possible badge.

``` r
library(badgr)

badge <- get_badge_static(
  "Left bit", "Right bit", "blue",
  to_clipboard = FALSE,  # don't copy to clipboard
  open_browser = FALSE  # don't send to browser
)
```

The output looks like this:

``` r
badge
#> [1] "![](https://img.shields.io/badge/Left bit-Right bit-blue)"
```

Which when rendered, looks like this:

![](https://img.shields.io/badge/Left%20bit-Right%20bit-blue)

By default:

  - the endpoint will be opened in your browser (`open_browser = TRUE`)
  - Markdown notation for displaying the badge (`![]()`) will be added
    (`add_markdown = TRUE`)
  - the whole string added to your clipboard (`to_clipboard = TRUE`)

## Code of Conduct

Please note that the {badgr} project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
