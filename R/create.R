
#' Generate The URL Endpoint For A Static Metadata Badge From shields.io
#'
#' @param label Text to display on the left half of the badge.
#' @param message Text to display on the right half of the badge.
#' @param color The color of the left side of the badge.
#' @param logo_path The URL of the logo image.
#' @param logo_filetype The filetype of the logo image.
#' @param open_browser Do you want to preview the badge in the browser? Requires
#'     an internet connection.
#' @param include_md Do you want to prepare the URL with Markdown syntax to allow
#'     for direct copying into a Markdown file? Otherwise you get the bare URL.
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
#' get_badge_static("Label", "Message", "blue")
#' }

get_badge_static <- function(

  label = "shields.io",
  message = "badge",
  color = "ff0000",

  # label_color  = NULL,
  # label_override = NULL,
  #
  # style = c("plastic", "flat", "for-the-badge", "social"),
  #
  # logo_simple = NULL,
  # logo_colour = NULL,
  # logo_width = NULL,
  #
  logo_path = NULL,
  logo_filetype = NULL,
  #
  # link_left = NULL,
  # link_right = NULL,

  include_md = TRUE,
  to_clipboard = TRUE,
  open_browser = TRUE

) {

  # Generate basic badge
  badge_url <- paste0(
    "https://img.shields.io/badge/",
    label, "-",
    message, "-",
    color
  )

  if (!is.null(logo_path)) {

    logo_path_64 <- base64enc::base64encode(logo_path)

    badge_url <- paste0(
      badge_url, "?",
      "logo=data:image/", logo_filetype, ";base64,", logo_path_64
    )

  }

  if (include_md == TRUE) {
    badge_url <- paste0("![](", badge_url, ")")
  }

  return(badge_url)

  if (open_browser == TRUE) {
    utils::browseURL(badge_url)
    cat("Opening browser to display badge\n")
  }

  if (to_clipboard == TRUE){
    clipr::write_clip(badge_url, return_new = TRUE)
    cat("Badge URL added to clipboard\n")
  }

}
