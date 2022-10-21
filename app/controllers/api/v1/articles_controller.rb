module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        @articles=Article.all
        render json: {status: 'SUCCESS',message:'Loaded articles',data: @articles},status: :ok
      end

      def show
        article=Article.find(params[:id])
        render json: {status: 'SUCCESS',message:'Loaded articles',data: article},status: :ok
      end
    end
  end
end