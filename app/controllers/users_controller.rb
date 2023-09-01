class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(:posts).find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # This is the only change from the scaffolded code.
    # We're using the bang version of save to raise an exception if it fails.
    # This way, we can use the rescue block to handle the error.
    if @user.save!
      redirect_to @user, notice: [success: 'User was successfully created.']
    else
      render :new, notice: [error: 'User was not created.']
    end
  rescue ActiveRecord::RecordInvalid => e
    # This executes if the rescue block is triggered
    # We can access the error messages by calling e.record.errors
    # We can also access the user object by calling e.record
    @user = e.record
    render :new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    # This is the only change from the scaffolded code.
    # We're using the bang version of update to raise an exception if it fails.
    # This way, we can use the rescue block to handle the error.
    @user = User.find_by(id: params[:id])
    if @user.update!(user_params)
      redirect_to @user
    else
      render :edit
    end
  rescue ActiveRecord::RecordInvalid => e
    # This executes if the rescue block is triggered
    # We can access the error messages by calling e.record.errors
    # We can also access the user object by calling e.record
    @user = e.record
    render :edit
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy!
    redirect_to users_path
  rescue ActiveRecord::RecordNotDestroyed => e
    # This executes if the rescue block is triggered
    # We can access the error messages by calling e.record.errors
    # We can also access the user object by calling e.record
    @user = e.record
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :posts_counter, :photo)
  end
end
