class AnswersController < ApplicationController
  before_action :answer_exists?, only: [:update]
  before_action :get_answer, only: [:answer_exists?, :create]

  def new
    @answer = Answer.new
  end

  def create
    if answer_exists?
      times = @answer.times
      @answer.update_attribute(:times, times + 1)

    else
      add_new_answer
    end
    binding.pry
    redirect_to :root
  end

  def index
  end

  def update
    # answer_text = params[:answer][:description]
    # answer = Answer.new(description: answer_text)
    # if answer.save
    #   redirect_to :root
    # else
    #   render :new
    # end
    add_new_answer
    answer = Answer.find(session[:answer_id])
    times = answer.times
    answer.update_attribute(times: times + 1)
    redirect_to :root
  end


  private

  def add_new_answer
    answer_text = params[:answer][:description]
    answer = Answer.new(description: answer_text, times: 1)
    answer.save
    current_choice.answers << answer
  end

  def answer_exists?
    !!@answer
  end

  def get_answer
    @answer = Answer.find_by(description: params[:answer][:description])
  end
end
