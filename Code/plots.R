#' Plot Scores by Category
#' @export
plot_scores_by_category <- function(data) {
  ggplot2::ggplot(data, ggplot2::aes(x = Category, y = Score / Total * 100, fill = Subject)) +
    ggplot2::geom_bar(stat = "identity", position = "dodge") +
    ggplot2::labs(title = "Scores by Category", y = "Percentage", x = "Category")
}
