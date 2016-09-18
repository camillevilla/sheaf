class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to work_path(@work)
    else
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def destroy
    @work = Work.find(params[:id])

    @work.destroy
    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:title)
  end
end
