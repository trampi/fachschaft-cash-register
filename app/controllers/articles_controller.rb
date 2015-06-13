class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article saved!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article saved!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    if Article.destroy(params[:id])
      flash[:notice] = "Article deleted!"
    else
      flash[:alert] = "Article could not be deleted!"
    end
    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:name, :price, :stock, :package_size, :barcode)
  end

  def update_stock
    if params[:stock_type] == "units"
      update_stock_by_units
    else
      update_stock_by_packages
    end
  end

  def update_stock_by_units
    @article = Article.find(params[:id])
    @article.stock += params[:stock].to_i
    @article.save
    redirect_to articles_path
  end

  def update_stock_by_packages
    @article = Article.find(params[:id])
    @article.stock += params[:stock].to_i * @article.package_size
    @article.save
    redirect_to articles_path
  end
end
