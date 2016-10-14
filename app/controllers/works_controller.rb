class WorksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @author = Author.new(author_params)

    # if the author in the form exists
    if Author.where(name: @author.name).empty? == false
      @author = Author.where(name: @author.name)
      @work = Work.new(work_params.merge(author_id: @author[0].id))
      @work.save
      @work = Work.last
      redirect_to work_path(@work)
    # if the author doesn't exist AND it saves
    elsif @author.save
      @work = Work.new(work_params.merge(author_id: @author.id))
      @work.save
        redirect_to work_path(@work)
    else
      render :new
    end


    # old controller
    # if @work.save
    #   redirect_to work_path(@work)
    # else
    #   render :new
    # end
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

  def author_params
    params.require(:author).permit(:name)
  end
end
