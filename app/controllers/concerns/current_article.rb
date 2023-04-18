module CurrentArticle
  private

  def set_article
    @currentArticle = Article.find(params[:id])
  end
end
