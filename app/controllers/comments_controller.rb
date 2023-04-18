class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret', only: [:destroy]
  before_action :set_article, only: %i[create update destroy]

  def create
    @newComment = @currentArticle.comments.create(comment_params)
    respond_to do |format|
      if @newComment.save
        format.html { redirect_to article_path(@currentArticle), notice: 'You have comment this article.' }
        format.json { render :show, status: :created, location: @currentArticle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @currentArticle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @currentComment = @currentArticle.comments.find(params[:id])
    @currentComment.destroy
    respond_to do |format|
      format.html do
        redirect_to article_path(@currentArticle), status: :see_other, notice: 'Comment was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @currentArticle = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
