class JokesController < ApplicationController
  def index
    if params[:search].present?
      # Apply the search filter before pagination
      @jokes = Joke.where("setup LIKE ? OR punchline LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
                   .page(params[:page]).per(10)
    else
      @jokes = Joke.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
