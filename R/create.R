
#' Generate A Static shields.io Badge
#'
#' Build a URL string that generates a \href{https://shields.io/}{shields.io}
#' metadata badge, which can be used in a README or elsewhere.
#'
#' @param label Text string to display on the left side of the badge.
#' @param message Text string to display on the right side of the badge.
#' @param color The background color of the right side of the badge. Should be
#'     one of hex, RGB, RGBA, HSL, HSLA or a CSS named color.
#' @param style One of \code{"plastic"}, \code{"flat"}, \code{"for-the-badge"}
#'     or \code{"social"}. See examples on \href{https://shields.io/}{shields.io}.
#' @param label_color The background color of the left side of the badge. Should
#'     be one of hex, RGB, RGBA, HSL, HSLA or a CSS named color.
#' @param link_left A URL string for the left side of the badge.
#' @param link_right A URL string for the right side of the badge.
#' @param logo_simple Text string that names a logo from
#'     \href{https://simpleicons.org/}{simple-icons.org} to be placed on the
#'     far left of the badge. (Use either a named logo with \code{logo_simple}
#'     or a custom logo with \code{logo_path}; not both.)
#' @param logo_color A color for the logo specified by \code{logo_simple}.
#' @param logo_width Horizontal spacing width round the logo.
#' @param logo_path URL string for your custom logo image. (Use either a named
#'     logo with \code{logo_simple} or a custom logo with \code{logo_path}; not
#'     both.)
#' @param open_browser Do you want to preview the badge in the browser? Requires
#'     an internet connection.
#' @param include_md Do you want to prepare the URL with Markdown syntax
#'     (\code{![]()}) to allow for direct copying into a Markdown file?
#'     Otherwise you get the bare URL.
#' @param to_clipboard Do you want the string to be copied to your clipboard so
#'     you can paste it elsewhere? Will overwrite your current clipboard items.
#'
#' @return A text string.
#' @importFrom clipr write_clip
#' @importFrom base64enc base64encode
#' @export
#'
#' @examples
#' \dontrun{
#' get_badge("Label", "Message", "blue")
#' }

get_badge <- function(

  label = "shields.io",
  message = "badge",
  color = "ff0000",
  style = "flat",
  label_color  = NULL,
  link_left = NULL,
  link_right = NULL,
  logo_simple = NULL,
  logo_color = NULL,
  logo_width = NULL,
  logo_path = NULL,
  open_browser = TRUE,
  include_md = TRUE,
  to_clipboard = TRUE

) {

  if (!style %in% c("plastic", "flat", "for-the-badge", "social")) {
    stop(
      "The 'style' argument must be one of 'plastic', 'flat', 'for-the-badge', or 'social'"
    )
  }

  if (is.null(logo_simple) & (!is.null(logo_color))) {
    warning("You set logo_color without specifying 'logo_simple'")
  }

  # Replace text elements
  label <- gsub("-", "--", label)
  label <- gsub("_", "__", label)
  label <- gsub(" ", "_", label)
  message <- gsub("-", "--", message)
  message <- gsub("_", "__", message)
  message <- gsub(" ", "_", message)

  # Generate basic badge
  badge_url <- paste0(
    "https://img.shields.io/badge/",
    label, "-",       # text for left side
    message, "-",     # text for right side
    color,            # background color for the right side
    "?style=", style  # style
  )

  # Background color for the left side
  if(!is.null(label_color)) {
    badge_url <- paste0(badge_url, "&labelColor=", label_color)
  }

  # Add a link to the left side of the badge
  if(!is.null(link_left)) {
    badge_url <- paste0(badge_url, "&link=", link_left)
  }

  # Add a link to the right side of the badge
  if(!is.null(link_right)) {
    badge_url <- paste0(badge_url, "&link=", link_right)
  }

  # Add named logo from https://simpleicons.org/
  if(!is.null(logo_simple)) {

    logo_simple <- gsub(" ", "-", logo_simple)  # replace spaces with hyphens
    badge_url <- paste0(badge_url, "&logo=", logo_simple)

    # Color for the logo
    if (!is.null(logo_color)) {
      badge_url <- paste0(badge_url, "&logoColor=", logo_color)
    }

  }

  # Convert logo path to base64
  if (!is.null(logo_path)) {

    # Encode
    logo_path_64 <- base64enc::base64encode(logo_path)

    # Add path to badge URL
    badge_url <- paste0(
      badge_url,
      "&logo=data:image/",
      tools::file_ext(gsub("/$", "", logo_path)),  # file extension
      ";base64,", logo_path_64
    )

  }

  # Spacing width for the logo
  if (!is.null(logo_width)) {
    badge_url <- paste0(badge_url, "&logoWidth=", logo_width)
  }

  # Open the badge URL in your browser
  if (open_browser == TRUE) {
    utils::browseURL(badge_url)
    cat("Opening browser to display badge\n")
  }

  # Make ready for use in Markdown
  if (include_md == TRUE) {
    badge_url <- paste0("![](", badge_url, ")")
  }

  # Write the badge URL to the clipboard
  if (to_clipboard == TRUE){
    clipr::write_clip(badge_url, return_new = TRUE)
    cat("Badge URL added to clipboard\n")
  }

  return(badge_url)

}
