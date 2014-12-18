class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
    redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.user_id == current_user.id
      if @question.update(question_params)
        redirect_to @question
      else
        render 'edit'
      end
    else
      flash[:notice] = "You must be the owner of that post to edit that"
      redirect_to @question
    end

  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user_id == current_user.id
    @question.destroy
    redirect_to questions_path
    else
      flash[:notice] = "You must be the owner of that post to delete that"
    redirect_to @question
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :text)
    end

end
