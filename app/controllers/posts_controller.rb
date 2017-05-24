class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.view_count = 0
    @post.category_id = 1

    if @post.save
      flash[:notice] = "文章保存成功"
      redirect_to @post
    else
      flash[:alert] = "文章保存失败"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @post.save
      @posts = current_user.reload.posts
      flash[:notice] = "文章修改成功"
      redirect_to @posts
    else
      flash[:alert] = "文章修改失败"
      render action: :edit
    end
  end

  def destroy
    @post.destroy

    @posts = current_user.reload.posts
    render action: :index
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
