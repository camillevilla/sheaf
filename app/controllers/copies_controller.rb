class CopiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_copy, only: [:show, :edit, :update, :destroy]
  before_action :set_metadata, only: [:show, :edit, :update]

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

  def edit
    @formats = Format.all
  end

  def create
    @author = Author.find_or_create_by(author_params)
    @work = Work.find_or_create_by(work_params.merge(author_id: @author.id))
    @publisher = Publisher.find_or_create_by(publisher_params)
    @edition = Edition.find_or_create_by(edition_params.merge(work_id: @work.id, publisher_id: @publisher_id))
    @copy = Copy.find_or_initialize_by(copy_params.merge(edition_id: @edition.id,user_id: current_user.id))
    
    if @copy.save
      redirect_to user_copy_path(current_user,@copy)
    else
      render :new
    end
  end

  def update
    if @copy.update(copy_params)
      redirect_to user_copy_path(@copy.owner, @copy)
    else
      render :edit
    end
  end

  def show
    @format = @copy.format
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

  def set_metadata
    @edition = @copy.edition
    @work = @edition.work
    @publisher = @edition.publisher
    @work = @edition.work
    @author = @work.author
  end

end
