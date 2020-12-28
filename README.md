
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {badgr}

<!-- badges: start -->

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![rostrum.blog
post](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2020/05/08/readme-badge/)
<!-- badges: end -->

The goal of {badgr} is to use R to generate URLs for custom [shields.io](https://shields.io/) metadata badges that you can use in your repository’s README file or elsewhere.

I’m not affiliated with the excellent [shields.io](https://shields.io/). You can [back or donate to them](https://opencollective.com/shields). Find out more from
their [website](https://shields.io/), [Twitter](https://twitter.com/Shields_io), [Discord](https://discord.com/invite/HjJCwm5) or go to [the source code](https://github.com/badges/shields).

_Update (2020-12-28): Somehow I missed the existence of [the {badger} package](https://github.com/GuangchuangYu/badger) by [Guangchuang Yu](https://guangchuangyu.github.io/), which is on CRAN. It contains functions for several pre-baked badge types, plus `badge_custom()`. I think the major difference is that {badgr} has a little more flexibility than {badger} for custom badge arguments and {badgr} also allows for custom icons to be added._

## Installation

You can install {badgr} from GitHub with:

``` r
remotes::install_github("matt-dray/badgr")
```

It’s a work in progress and there are no guarantees.

## Examples

The following examples contain examples that are:

1.  Simple (bare bones functionality)
2.  More complex (add a logo and change the style)
3.  With a custom logo

### 1. Simple

This is a basic example that shows you how to generate the simplest
possible badge.

``` r
library(badgr)

badge <- get_badge(
  "Left bit", "Right bit", "blue",
  to_clipboard = FALSE,     # don't copy to clipboard
  browser_preview = FALSE   # don't send to browser
)
```

The output looks like this:

``` r
badge
#> [1] "![](https://img.shields.io/badge/Left_bit-Right_bit-blue?style=flat)]"
```

Which when rendered, looks like this:

![](https://img.shields.io/badge/Left_bit-Right_bit-blue?style=flat)

### 2. More complex

Let’s use a few more arguments. For example, we can include a
pre-prepared logo from <https://simpleicons.org/> and provide a link
that will be added to the Markdown, so clicking the badge will take you
to that site.

``` r
badge2 <- get_badge(
  label = "Left bit",
  message = "Right bit",
  color = "red",
  style = "for-the-badge",         # default was 'flat'
  label_color = "blue",            # colour for the left side
  md_link = "https://shields.io",  # include a link in the Markdown
  logo_simple = "RStudio",         # a simpleicons.org logo
  logo_color = "white",            # a color for that logo
  logo_width = 20,                 # pad width around logo 
  browser_preview = FALSE,
  to_clipboard = FALSE
)

badge2
#> [1] "[![](https://img.shields.io/badge/Left_bit-Right_bit-red?style=for-the-badge&labelColor=blue&logo=RStudio&logoColor=white&logoWidth=20)](https://shields.io)"
```

Which looks like
this:

[![](https://img.shields.io/badge/Left_bit-Right_bit-red?style=for-the-badge&labelColor=blue&logo=rstudio&logoColor=white&logoWidth=20)](https://shields.io)

Clicking it will take you to the link specified by the `md_link`
argument.

### 3. Custom logo

What if you don’t want to use a logo from <https://simpleicons.org/>?
You can use your own. Here, for example, I’m using [a small
gif](https://raw.githubusercontent.com/matt-dray/rostrum-blog/master/static/images/favicon.gif)
of the logo from [my blog](https://www.rostrum.blog/).

``` r
# Path to custom logo
logo <- "https://raw.githubusercontent.com/matt-dray/rostrum-blog/master/static/images/favicon.gif"

badge3 <- get_badge(
  label = "rostrum.blog",
  message = "post",
  color = "008900",  # color can be supplied as hex
  label_color = "black",
  md_link = "https://www.rostrum.blog/",
  logo_path = logo,
  browser_preview = FALSE,
  to_clipboard = FALSE
)

badge3
#> [1] "[![](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/)"
```

Which looks like this (note that the image is subtly
animated\!):

[![](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/)

Again, you can click this badge to be taken to the link specified in
`md_link`, i.e. <https://www.rostrum.blog/>.

Note that the output Markdown string for this example was much longer
than for the previous examples. This is the result of converting the image into
[base64](https://en.wikipedia.org/wiki/Base64) with
`base64enc::base64encode()`. This is a requirement for embedding a
custom icon into a shields.io badge.

## Code of Conduct

Please note that the {badgr} project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
