class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  # skip_before_filter :require_login, :only=>[:edit,:update]  # research if better
  # skip_before_filter :require_login, :except=>[:new,:create]

  def index
    @users = User.order(username: :asc)  # in the future Sort by reputation
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    set_user
    #  @user = User.find_by(id: session[:user_id])
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Welcome to the HerStory.center!'
      redirect_to user
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(id: params[:id])
  end

   def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
   end

   def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = 'Please log in'
       redirect_to login_url
     end
   end

   def correct_user
     set_user
     redirect_to(root_url) unless current_user?(@user)
   end

end
