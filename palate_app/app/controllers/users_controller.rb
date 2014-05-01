class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def index
    @users = User.paginate(page: params[:page])
  end


  def show
  	@user = User.find(params[:id])
    @user_feed_items  = @user.microposts.take(20)
    @adventurousness
    @instinctiveness
    @pace
    @valence
    taste_profile
  end


  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Palate!"
      redirect_to @user
    else
      	render 'new'
    end
  end

  def omniauth
    @user = User.from_omniauth(auth_hash)
    sign_in(@user)
    redirect_to @user
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end




  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :adventurousness_affinity, :instinctiveness_affinity, :pace_affinity,
                                   :valence_affinity, :freshness_affinity)
    end

    def taste_profile
      
      unless (@user.adventurousness_affinity.nil? || @user.instinctiveness_affinity.nil? || @user.pace_affinity.nil? || @user.valence_affinity.nil?)
        if @user.adventurousness_affinity > 0.5
          @adventurousness = "inventive"
        else
          @adventurousness = "classic"
        end
        if @user.instinctiveness_affinity > 0.5
          @instinctiveness = "visceral"
        else
          @instinctiveness = "cerebral"
        end
        if @user.pace_affinity > 0.5
          @pace = "energetic"
        else
          @pace = "reflective"
        end
        if @user.valence_affinity > 0.5
          @valence = "jovial"
        else
          @valence = "enigmatic"
        end
      end
      
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
