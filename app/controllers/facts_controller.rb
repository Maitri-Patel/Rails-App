class FactsController < ApplicationController
  # Display a paginated list of facts
  def index
    @facts = Fact.page(params[:page]).per(10)
  end

  # Display a single fact detail
  def show
    @fact = Fact.find(params[:id])
  end
end


