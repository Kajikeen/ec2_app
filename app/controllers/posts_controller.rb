class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @question = Question.new(
      content: params[:content]
    )
    @question_view = Question.where(
      post_id: @post.id,
    )
    @question_view_user = Question.where(
      post_id: @post.id,
      answer:["YES!","NO!"],
    )
    @good = Question.find_by(id: params[:id])
    end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      title: params[:title],
      answer: params[:answer],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/index")
      else
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.answer = params[:answer]
    if @post.save
      flash[:notice] = "変更しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
      flash[:notice] = "削除しました"
    redirect_to("/posts/index")
  end


  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
