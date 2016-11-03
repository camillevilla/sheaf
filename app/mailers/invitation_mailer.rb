class InvitationMailer < ApplicationMailer

  def join_sheaf(user, email)
    @user = user
    mail(
      :subject => 'Welcome to Sheaf Books',
      :to      => email,
      :from    => 'camille.villa@sheaf-books.com',
    )
  end

end
