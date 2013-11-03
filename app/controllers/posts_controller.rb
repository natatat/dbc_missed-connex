class PostsController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(params[:post])
    if @post.save
      redirect_to category_path(@category.id)
    else
      flash[:notice] = "your post was not saved"
      redirect_to category_path(@category.id)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end