class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)
    @answer.question_id = @question.id
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def new
    @answer = Answer.new
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
