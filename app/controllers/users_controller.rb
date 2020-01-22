class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]

	def show
	    @user = User.find(params[:id])
	    @books = @user.books.page(params[:page]).reverse_order
        @book =Book.new
	end
	def edit
        @user = User.find(params[:id])
    end
    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    	   redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
        else
            flash[:notice] = ' error You have not updated user.'
            render :edit
        end
    end

    def index
    	@users = User.all.reverse_order
        @user = current_user
        @book = Book.new
    end

    private
	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end


    def correct_user
        user = User.find(params[:id])
        if current_user != user
        redirect_to user_path(current_user.id)
    end
    end
end