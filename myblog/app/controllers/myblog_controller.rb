class MyblogController < ApplicationController
    before_action :move_to_index, except: :index

	def index
		@article = Article.all.order("created_at DESC").page(params[:page]).per(3)
	end

	def new
	end

	def create
		Article.create(title: myblog_params[:title], image: myblog_params[:image], content: myblog_params[:content], user_id: current_user.id)
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy if article.user_id == current_user.id
    end

    def edit
    	@article = Article.find(params[:id])
    end

    def update
    	article = Article.find(params[:id])
    	article.update(myblog_params) if article.user_id == current_user.id
    end


	private
	def myblog_params
		params.permit(:title, :image, :content)
	end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
