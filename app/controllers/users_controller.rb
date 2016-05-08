class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now
        redirect_to '/'
      else
        render 'new'
      end
    end
  end



  private
    def user_params
      params.require(:user).permit(:email, :password)
    end


end
