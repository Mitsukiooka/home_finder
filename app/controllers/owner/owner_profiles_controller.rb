class Owner::OwnerProfilesController < Owner::ApplicationController
  before_action :set_owner_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @owner_profile = current_owner.build_owner_profile
  end

  def create
    @owner_profile = current_owner.build_owner_profile(owner_profile_params)
    if @owner_profile.save
      redirect_to owner_owner_profile_path(@owner_profile.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @owner_profile.update(owner_profile_params)
      redirect_to owner_owner_profile_path(@owner_profile.id)
    else
      render 'edit'
    end
  end

  def destroy
    @owner_profile.destroy
    redirect_to owner_owner_profiles_path
  end

  private
  def set_owner_profile
    @owner_profile = current_owner.owner_profile
  end

  def owner_profile_params
    params[:owner_profile].permit(
      :name,
      :country,
      :comment
    )
  end
end
