class AnswersController < QuestionsController

  def index
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = current_question.answers.new(answer_params)
    if @answer.save
      redirect_to @answer.question, notice: "Answer added correctly."
    else
      redirect_to @answer.question, alert: "Sorry answer could not be added."
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end


