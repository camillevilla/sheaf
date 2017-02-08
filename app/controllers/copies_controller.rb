class CopiesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_copy, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.find(params[:user_id])
    # Only allow users to view their own library or their friends' libraries
    if access_authorized?(@user) == false
      redirect_to root_url
    end

    @copies = Copy.where(user_id: params[:user_id])

    respond_to do |format|
      format.html
      format.csv { send_data @copies.csv_export, filename: "library.csv"}
    end
  end

  def new
    @copy = Copy.new
    @formats = Format.all
    if current_user != User.find(params[:user_id])
      redirect_to root_url
    end
  end

  def create
    @author = Author.new(author_params)
    if Author.where(name: @author.name).empty?
      @author.save
    end
    @author = Author.where(name: @author.name)

    @work = Work.new(work_params.merge(author_id: @author[0].id))
    if Work.where(title: @work.title).empty?
      @work.save
    end
    @work = Work.where(title: @work.title)[0]

    @publisher = Publisher.new(publisher_params)
    if Publisher.where(name: @publisher.name).empty?
      @publisher.save
    end
    @publisher = Publisher.where(name: @publisher.name)
    
    @edition = Edition.new(edition_params.merge(
        work_id: @work.id,
        publisher_id: @publisher[0].id
      ))   
    if Edition.where(work_id: @work.id, publisher_id: @publisher_id).empty?
      @edition.save
    else
      @edition = Edition.where(work_id: @work.id, publisher_id: @publisher_id)[0]
    end    

    @copy = Copy.new(copy_params.merge(
      edition_id: @edition.id,
      user_id: current_user.id
      ))
    if @copy.save
      redirect_to user_copy_path(current_user,@copy)
    else
      render :new
    end

  end

  def show
    @edition = @copy.edition
    if access_authorized?(@copy.owner) == false
      redirect_to root_url
    end
  end

  def destroy
    @copy.destroy
    redirect_to copies_path
  end

  private

  # params
  def copy_params
    params.require(:copy).permit(:user_id, :edition_id, :acquisition_date, :format_id, :url)
  end

  def edition_params
    params.require(:edition).permit(:author_id, :work_id, :publisher_id, :publication_year, :isbn10, :isbn13)
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

  # filters

  def set_copy
    @copy = Copy.find(params[:id])
  end

end
