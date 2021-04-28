class User::UserProfilesController < User::ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user_profile = current_user.build_user_profile
  end

  def create
    @user_profile = current_user.build_user_profile(user_profile_params)
    if @user_profile.save
      redirect_to user_user_profile_path(@user_profile.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      redirect_to user_user_profile_path(@user_profile.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user_profile.destroy
    redirect_to user_user_profiles_path
  end

  private
  def set_user_profile
    @user_profile = current_user.user_profile
  end

  def user_profile_params
    params[:user_profile].permit(
      :name,
      :gender,
      :comment,
      :age,
      :email,
      :phone_number,
      :description
    )
  end
end
