class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret', except: %i[index show]

  def index
    @allArticles = Article.all.order(:title).with_attached_images
  end

  def show
    @showArticle = Article.find(params[:id])
  end

  def new
    @newArticle = Article.new
  end

  def create
    @newArticle = Article.new(article_label)
    @newArticle.images.attach(params[:article][:images])
    if @newArticle.save
      redirect_to articles_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @editArticle = Article.find(params[:id])
  end

  def update
    @editArticle = Article.find(params[:id])
    if @editArticle.update(article_label)
      redirect_to articles_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @removeArticle = Article.find(params[:id])
    @removeArticle.destroy
    redirect_to root_path
  end

  private

  def article_label
    params.require(:article).permit(:title, :body, :status, :images)
  end
end

