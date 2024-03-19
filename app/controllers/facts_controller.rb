class FactsController < ApplicationController
  def index
    if params[:search].present?
      @facts = Fact.where("fact LIKE ?", "%#{params[:search]}%").page(params[:page]).per(10)
    else
      @facts = Fact.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @fact = Fact.find(params[:id])
  end
end
