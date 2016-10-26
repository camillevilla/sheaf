class FriendrequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @pending_requests = current_user.sent_friendrequests.where(status:0)
    @received_requests = current_user.received_friendrequests.where(status:0)
  end

  def new
    @request = Friendrequest.new
  end

  def create

    recipient = User.where(email: friendrequest_params[:recipient_id])[0]

    @request = Friendrequest.new(friendrequest_params.merge(
      recipient_id: recipient.id, 
      sender_id: current_user.id,
      status: 0)
    )

    # TODO:
      # redirect to invitation page if user is not on Sheaf
        #error message - "Your friend isn't on Sheaf yet! Send them an invitation?"
      # figure out a delicate way to handle rejected requests

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
    elsif Friendrequest.where(
      recipient_id: current_user.id, 
      sender_id: recipient.id,
      status: 1).empty? == false
      redirect_to friendrequests_path
      # error message - "You're already friends!"
    elsif @request.save
      redirect_to friendrequests_path
    else
      render :new
    end
  end

  def update
  end

  private

  def friendrequest_params
    params.require(:friendrequest).permit(:sender_id, :recipient_id, :status)
  end
end
