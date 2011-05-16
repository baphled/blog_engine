module BlogEngine
  class CommentsController < ApplicationController
    
    def create
      @article = BlogEngine::Article.find params[:article_id]
      @comment = @article.comments.new params[:blog_engine_comment]
      if @comment.save
        flash[:notice] = "Comment has been added to '#{@article.title}'"
        redirect_to blog_engine_published_article_path(
          :year => @article.published_at.year, :month => @article.published_at.month, :slug => @article.slug
        )
      end
    end
  end
end