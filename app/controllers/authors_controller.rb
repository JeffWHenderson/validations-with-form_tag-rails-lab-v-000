class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author = Author.create(author_params)
      redirect_to author_path(@author)
    else
      #here is where i can have the bad infor saved and add a message to user and fill in form
      # renders an error list
      # prefills fields
      #has error class on bad fields
      render :new
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
