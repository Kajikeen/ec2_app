class QuestionsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(
      content: params[:content],
      user_id: @current_user.id,
      post_id: params[:post_id],
      good: "A"
    )
    if @question.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/#{params[:post_id]}")
      else
      flash[:notice] = "投稿失敗"
      redirect_to("/posts/#{params[:post_id]}")
    end
  end

  def yes
    @question = Question.find_by(
      id: params[:id]
    )
    @question.answer = "YES!"
    @question.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def no
    @question = Question.find_by(
      id: params[:id]
      )
    @question.answer = "NO!"
    @question.save
    redirect_to("/posts/#{params[:post_id]}")
  end

end
