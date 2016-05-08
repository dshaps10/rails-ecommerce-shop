class UserMailer < ApplicationMailer
  default from: 'foxhoundshield@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Ye Old Shoppe')
  end
end
