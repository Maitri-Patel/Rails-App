class JokesController < ApplicationController
  def index
    @jokes = Joke.page(params[:page]).per(10)
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
