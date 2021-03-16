class UsersController < ApplicationController
  def start
    build_sign_up_step_one
  end

  def create
    build_sign_up_step_one
    save_sign_up_step_one or render 'start'
  end

  def next
    load_sign_up_step_two
    build_sign_up_step_two
  end

  def update
    load_sign_up_step_two
    build_sign_up_step_two
    save_sign_up_step_two or render 'next'
  end

  def done
    load_sign_up_step_two
  end

  private

  def build_sign_up_step_one
    @user ||= sign_up_step_one_scope.build
    @user.attributes = user_params
  end

  def build_sign_up_step_two
    @user ||= sign_up_step_two_scope.build
    @user.attributes = user_params
  end

  def sign_up_step_one_scope
    SignUpStepOne.unscoped
  end

  def sign_up_step_two_scope
    SignUpStepTwo.unscoped
  end

  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:birthday, :email, :first_name,:gender,:last_name,:university,:password,:password_confirmation) : {}
  end

  def save_sign_up_step_one
    if @user.save
      redirect_to  next_user_path(@user)
    end
  end

  def save_sign_up_step_two
    if @user.save
      flash[:notice] = "User successfully created."
      redirect_to done_user_path(@user)
    end
  end

  def load_sign_up_step_two
    @user ||= sign_up_step_two_scope.find(params[:id])
  end
end
