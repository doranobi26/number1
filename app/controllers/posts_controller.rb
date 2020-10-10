class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.pictures.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      @post.pictures.new
      render "new"
    end
  end

  def index
    @posts=Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @category = @post.category
    @pictures = @post.pictures
  end

  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:post).permit(:title, :caption, :user_id, :member, :category_id, pictures_pictures: [])
  end

end
