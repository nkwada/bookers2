class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

    def new
    	@book = Book.new
    end
    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
    	if @book.save
            redirect_to books_path, notice: 'Book was successfully created'
        else
            @books = Book.all.reverse_order
            @user = current_user
            flash[:notice] = 'error Book was not created'
            render :index
        end
    end

    def index
    	@books = Book.all.reverse_order
        @user = current_user
        @book = Book.new
    end
    def show
        @booknew = Book.new
        @book = Book.find(params[:id])
        @user = current_user
        @books = Book.find(params[:id])
    end
    def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path, notice: 'Book was successfully destroyed'
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book.id), notice: 'Book was successfully updated'
        else
            flash[:notice] = 'error Book was not updated'
            render :edit
        end
    end
    private
    def book_params
        params.require(:book).permit(:title, :body,)
    end

    def correct_user
        book = Book.find(params[:id])
        if current_user.id != book.user.id
        redirect_to books_path
    end
    end
end