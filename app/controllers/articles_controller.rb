class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Votre article a été crée avec succès !'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "L'article a été modifié"
      redirect_to article_path(@article)
    else
      flash[:notice] = "L'article n'a pas pu été modifié"
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :reading_time)
  end
end
