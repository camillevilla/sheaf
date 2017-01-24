class LoansController < ApplicationController
  skip_before_action :verify_authenticity_token
  # include TwilioHelper

  def index
    @borrowed_copies = Loan.where(borrower: current_user, status_code: 1)
    @lent_copies = Loan.where(status_code:1).select{|a| a.owner.id == current_user.id}

    # refactor this method later OR write a helper
    @pending_requests = Loan.where(status_code:0).select{|a| a.owner.id == current_user.id}

  end

  def new
    @copy = Copy.find(params[:copy_id])
    @owner = @copy.owner
  end

  def create
    @loan = Loan.create(borrower: current_user, copy_id: params[:copy_id],status_code: 0)

    redirect_to user_copies_path(@owner)
  end

  def update
    @loan = Loan.find(params[:id])
    @loan.lend_copy
    @loan.save
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.return_copy
    @loan.save
  end

end
