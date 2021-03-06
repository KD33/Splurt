class QuotesController < ApplicationController
  def index
    #store a random quote from our database in a variable called @quote
    @quote = Quote.order("RANDOM()").first
  end



  def create
    #This is what sends the saying and author to the database so they are saved
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> The data you entered is invalid.'
    end
    redirect_to root_path
  end

  private

  def quote_params
    #this pulls the values of saying and author from the quotes
    #permit is a safety measure to make sure hackers cannot inject anything
    #other than saying and author into the quote form
    params.require(:quote).permit(:saying, :author)
  end

  def about
  end

end
