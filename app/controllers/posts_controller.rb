class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: '保存完了'
    else
      flash.now[:error] = '保存に失敗'
      render :new
    end
  end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post), notice: '更新完了'
      else
        flash.now[:error] = '更新に失敗'
        render :new
    end
  end

  def destroy
    post = Post(params[:id])
    post.destroy!
    redirect_to root_path, notice: '削除成功'
  end

  private 
  def post_params
    params.require(:post).permit(:title, :content)
  end
end