class QuotesController < ApplicationController
  def index
    #store a random quote from our database in a variable called @quote
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end

  def create
    #This is what sends the saying and author to the database so they are saved
    Quote.create(quote_params)
    redirect_to root_path
  end

  private

  def quote_params
    #this pulls the values of saying and author from the quotes
    #permit is a safety measure to make sure hackers cannot inject anything
    #other than saying and author into the quote form
    params.require(:quote).permit(:saying, :author)
  end

end
