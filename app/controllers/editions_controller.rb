class EditionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @editions = Edition.all
  end

  def new
    @edition = Edition.new
  end

  def create
    # DRY this up later
    @author = Author.new(author_params)
    if Author.where(name: @author.name).empty? == false
      @author = Author.where(name: @author.name)
    else
      @author.save
      @author = Author.where(name: @author.name)
    end

    @work = Work.new(work_params.merge(author_id: @author[0].id))
    if Work.where(title: @work.title).empty? == false
      @work = Work.where(title: @work.title)
    else
      @work.save
    end

    @publisher = Publisher.new(publisher_params)
    if Publisher.where(name: @publisher.name).empty? == false
      @publisher = Publisher.where(name: @publisher.name)
    else
      @publisher.save
    end

    @edition = Edition.new(edition_params.merge(
        work_id: @work.id,
        publisher_id: @publisher.id
      ))

    if @edition.save
      redirect_to edition_path(@edition)
    else
      render :new
    end

  end

  def show
    @edition = Edition.find(params[:id])
  end

  def destroy
    @edition = Edition.find(params[:id])

    @edition.destroy
    redirect_to editions_path
  end

  private

  def edition_params
    params.require(:edition).permit(:author_id, :work_id, :publisher_id, :publication_year, :format, :isbn10, :isbn13)
  end

  def publisher_params
    params.require(:publisher).permit(:name)
  end

  def work_params
    params.require(:work).permit(:title)
  end

  def author_params
    params.require(:author).permit(:name)
  end
end