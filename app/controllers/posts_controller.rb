class PostsController < ApplicationController

  before_action :set_target_post, only: [:edit, :update, :destroy, :show]


  def index
     @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
     @posts = @posts.page(params[:page])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "「#{@post.title}」の記事が投稿されました!"
      redirect_to @post
    else
      redirect_to new_post_path, flash: {
        post: @post,
        error_messages: @post.errors.full_messages
      }
    end
  end

  def new

    @post = Post.new

  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    flash[:notice] = "「#{@post.title}」の記事が更新されました!"
    redirect_to @post
  end

  def destroy


    @post.destroy
    flash[:notice] = "「#{@post.title}」の記事を削除しました。"
    redirect_to posts_path
  end


  private

   def post_params
     params.require(:post).permit(:name, :title, :content, :image, :video, tag_ids: [])
   end

   def set_target_post
     @post=Post.find(params[:id])
   end



end
