class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def new
    @publisher = Publisher.new
    
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to publisher_path(@publisher)
    else
      render :new
    end
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])

    @publisher.destroy
    redirect_to publishers_path
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
