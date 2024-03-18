class JokesController < ApplicationController
  def index
    if params[:search].present?
      @jokes = Joke.where("setup LIKE ? OR punchline LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @jokes = Joke.all
    end
  end

  def show
    @joke = Joke.find(params[:id])
  end
end

