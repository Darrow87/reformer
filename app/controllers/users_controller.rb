class UsersController < ApplicationController

    # GET /users/new
    # This action is typically used to display a form for creating a new user.
    def new
        @user = User.new
    end
  
    # POST /users
    # This action is used to handle the form submission, attempting to create a new user with the provided parameters.
    def create
      @user = User.new(user_params)
        if @user.save
          redirect_to new_user_path
        else
          render :new, status: :unprocessable_entity
        end
    end 

      # GET /users/:id/edit
          # GET /users/:id/edit
   def edit
    # @user is set by set_user
   end

  # PATCH/PUT /users/:id
   def update
     if @user.update(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
     else
       render 'edit'
     end
   end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end