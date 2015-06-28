module ArticlesHelper
  def row_stock_class(article)
    return "danger" if article.stock < article.package_size * 2
  end
end
