class ChoicesController < ApplicationController
  def index

  end

  def new
    @choice = Choice.new
  end

  def create
    binding.pry
    choice = params[:choice][:name]
    sessions[:current_choice] = choice
    if choice.save
      redirect_to new_answer_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end
