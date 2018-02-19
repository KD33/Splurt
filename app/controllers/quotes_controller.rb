class QuotesController < ApplicationController
  def index
    #store a random quote from our database in a variable called @quote
    @quote = Quote.order("RANDOM()").first
  end
end
