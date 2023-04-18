class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret', except: %i[index new show]

  before_action :set_article, only: %i[show edit update destroy]
  def index
    @allArticles = Article.all.includes(:comments).show_public
  end

  def show
    @showArticle = Article.find(params[:id])
  end

  def new
    @newArticle = Article.new
  end

  def edit
    @editArticle = Article.find(params[:id])
  end

  def create
    @newArticle = Article.new(atricles_params)
    respond_to do |format|
      if @newArticle.save
        format.html { redirect_to articles_url, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @currentArticle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @newArticle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @editArticle = Article.find(params[:id])
    respond_to do |format|
      if @editArticle.update(atricles_params)
        format.html { redirect_to articles_url(@editArticle), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @editArticle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @currentArticle.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def atricles_params
    params.require(:article).permit(:title, :body, :status, :picture, images: [])
  end

  def set_article
    @currentArticle = Article.find(params[:id])
  end
end
