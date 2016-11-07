class CopiesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index
    @copies = Copy.where(user_id: params[:user_id])

    # Only allow users to view their own library or their friends' libraries
    if current_user == User.find(params[:user_id])
      @user = current_user
    elsif friends?(current_user.id, params[:user_id])
      @user = User.find(params[:user_id])
    else
      redirect_to root_url
    end
  end

  def new
    @copy = Copy.new
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
    @copy = Copy.find(params[:id])
    @edition = @copy.edition
    if !(@copy.owner == current_user || friends?(current_user.id, @copy.owner.id))
      redirect_to root_url
    end
  end

  def destroy
    @copy = Copy.find(params[:id])

    @copy.destroy
    redirect_to copies_path
  end

  private

  def copy_params
    params.require(:copy).permit(:user_id, :edition_id, :acquisition_date)
  end

  def edition_params
    params.require(:edition).permit(:author_id, :work_id, :publisher_id, :publication_year, :format_type, :isbn10, :isbn13)
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
