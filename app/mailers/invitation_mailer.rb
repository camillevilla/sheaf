class InvitationMailer < ApplicationMailer
  def join_sheaf(user,recipient)
    @user = user
    mail(
      :subject => 'Welcome to Sheaf Books',
      :to      => recipient,
      :from    => 'camille.villa@sheaf-books.com',
    )
  end
end
