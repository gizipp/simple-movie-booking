class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      session[:user_id] = @user.id.to_s
      flash[:notice] = "Account created successfully!"
      redirect_to bookings_path
    else
      flash.now.alert = "Oops, couldn't create account."
      render :new
    end
  end

  def booking
    @bookings = current_user.bookings.order(created_at: :desc)
  end

  def book
    current_user.bookings.create(screening_id: params[:screening_id])
    redirect_to bookings_path
  end

  def cancel_booking
    current_user.bookings.find_by(id: params[:id]).delete
    redirect_to bookings_path
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
