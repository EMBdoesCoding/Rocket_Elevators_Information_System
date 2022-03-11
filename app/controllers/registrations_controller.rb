class RegistrationsController < ApplicationController
  def new
    user = User.new
  end
  
  def create
    user = User.new(user_params)
    
    # binding.pry
    if user.save!
      puts "Yes"
      WelcomeMailer.with(user_id: user).welcome_email.deliver_now
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully created account'
    

    else
      puts "No"
      render :new
    end
  end
  private

    

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  # binding.pry

end

