class PostsController < ApplicationController

  before_action :set_target_post, only: [:edit, :update, :destroy, :show]
  before_action :login_user, only: [:index, :create, :new]
  skip_before_action :login_required, only: :index

  def index
     if @user
       @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : @user.posts
       @posts = @posts.page(params[:page])
    else
      @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      @posts = @posts.page(params[:page])
    end
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      flash[:info] = "「#{@post.title}」の記事が投稿されました!"
      redirect_to posts_path
    else
      redirect_to new_post_path, flash: {
        post: @post,
        error_messages: @post.errors.full_messages
      }
    end
  end

  def new

    @post = @user.posts.build

  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
    flash[:info] = "「#{@post.title}」の記事が更新されました!"
    redirect_to @post
  end

  def destroy


    @post.destroy
    flash[:info] = "「#{@post.title}」の記事を削除しました。"
    redirect_to posts_path
  end


  private

   def post_params
     params.require(:post).permit(:name, :title, :content, :image, :video, tag_ids: [])
   end

   def set_target_post
     @user = current_user if session[:user_id]
     @post= @user.posts.find_by(id: params[:id])
   end

   def login_user

     @user = current_user if session[:user_id]
   end



end
