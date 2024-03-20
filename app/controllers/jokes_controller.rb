class JokesController < ApplicationController
  def index
    scope = Joke.all

    if params[:search].present?
      scope = scope.where("setup LIKE ? OR punchline LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:category_id].present?
      scope = scope.where(category_id: params[:category_id])
    end

    @jokes = scope.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @joke = Joke.find(params[:id])
  end
end
