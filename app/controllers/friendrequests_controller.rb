class FriendrequestsController < ApplicationController
  def index
    @pending_requests = current_user.sent_friendrequests.where(status:0)
    @received_requests = current_user.received_friendrequests.where(status:0)
  end

  def new
  end

  def update
  end
end
