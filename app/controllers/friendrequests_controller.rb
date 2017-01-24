class FriendrequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @pending_requests = current_user.sent_friendrequests.where(status:0)
    @received_requests = current_user.received_friendrequests.where(status:0)
  end

  def new
    @request = Friendrequest.new
  end

  def create

    @email = friendrequest_params[:recipient_id]
    recipient = User.where(email: @email)[0]

    # send email invitation
    if recipient == nil 
      InvitationMailer.join_sheaf(current_user, @email).deliver_now
      redirect_to friendrequests_path
    else
      @request = Friendrequest.new(friendrequest_params.merge(
        recipient_id: recipient.id, 
        sender_id: current_user.id,
        status: 0)
      )
      #prevent creating multiple requests to same user
      if Friendrequest.where(
        recipient_id: recipient.id, 
        sender_id: current_user.id,
        status: 0).empty? == false
        redirect_to friendrequests_path
        # error message - "You have already sent a request to user"
      # prevent creating reciprocal pending requests
      elsif Friendrequest.where(
        recipient_id: current_user.id, 
        sender_id: recipient.id,
        status: 0).empty? == false
        redirect_to friendrequests_path
        # error message - "User has already sent you a request. Accept their invitation below:"
      # prevent adding existing friends
      elsif friends?(current_user.id, recipient.id)
        redirect_to friendrequests_path
        # error message - "You're already friends!"
      elsif @request.save
        redirect_to friendrequests_path
      else
        render :new
      end
    end
  end

  def update
    @friendrequest = Friendrequest.find(params[:id])
    @friendrequest.accept_request
    redirect_to friendrequests_path
  end

  def destroy
    @friendrequest = Friendrequest.find(params[:id])
    @friendrequest.destroy
    redirect_to friendrequests_path
  end

  private

  def friendrequest_params
    params.require(:friendrequest).permit(:sender_id, :recipient_id, :status)
  end
end
