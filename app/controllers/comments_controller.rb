class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", only: [ :destroy]
  def create
    @currentArticle=Article.find(params[:article_id])
    @newComment=@currentArticle.comments.create(comment_params)
    redirect_to article_path(@currentArticle)
  end

  def destroy
    @currentArticle=Article.find(params[:article_id])
    @currentComment=@currentArticle.comments.find(params[:id])
    @currentComment.destroy
    redirect_to article_path(@currentArticle), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter,:body ,:status) 
  end

end
