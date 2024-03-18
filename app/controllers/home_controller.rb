class HomeController < ApplicationController
  def index
    @random_jokes = Joke.order("RANDOM()").limit(5)
    @random_facts = Fact.order("RANDOM()").limit(5)
  end
end
