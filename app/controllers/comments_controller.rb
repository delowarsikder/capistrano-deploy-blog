class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret', only: [:destroy]
  before_action :set_article  ,only: %i[create update destroy]

  def create
    puts 'current article id'
    puts @currentArticle

    @newComment = @currentArticle.comments.create(comment_params)
    redirect_to article_path(@currentArticle)
  end

  def destroy
    @currentComment = @currentArticle.comments.find(params[:id])
    @currentComment.destroy
    redirect_to article_path(@currentArticle), status: :see_other
  end

  private

  def set_article
    @currentArticle = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
