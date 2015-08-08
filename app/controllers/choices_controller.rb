class ChoicesController < ApplicationController
  helper_method :most_numerous_answer, :least_numerous_answer, :multiple_choices?

  def index
    session[:choice_id] = Choice.all.last.id if session[:choice_id].nil?
    @choice = current_choice
  end

  def new
    @choice = Choice.new
  end

  def create
    choice_name = params[:choice][:name]
    session[:answer_id] = params[:answer][:description]
    choice = Choice.new(name: choice_name)
    unless Choice.all.empty?
      add_previous(choice)
    end

    answer = save_answer
    choice.answers << answer
    if choice.save
      session[:choice_id] = choice.id
      redirect_to :root
    else
      render :new
    end
  end

  def next
    session[:choice_id] = current_choice.next_id if current_choice.next_id
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end

  def previous
    session[:choice_id] = current_choice.previous_id if current_choice.previous_id
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  # def choices_params
  #   params.require(:choice).permit(:name)
  # end
  def add_previous(choice)
    choice.previous_id = Choice.all.last.id
  end

  def most_numerous_answer
    current_choice.answers.max { |a,b| a.times <=> b.times}
  end

  def least_numerous_answer
    current_choice.answers.min { |a,b| a.times <=> b.times}
  end

  def save_answer
    answer_text = session[:answer_id]
    answer = Answer.new( description: answer_text, times: 1 )
    answer.save
    return answer
  end

  def multiple_choices?
   Choice.all.size > 1
  end
end
