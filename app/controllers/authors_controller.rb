class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
    work = @author.works.build
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, works_attributes: [:title])
  end
end
