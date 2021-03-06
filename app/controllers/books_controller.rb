class BooksController < ApplicationController
  def index
    # ↓kaminariを使用
    @books = Book.page(params[:page]).reverse_order.where(user_id: current_user.id)
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  # ↓他者の投稿ページの記述（kaminari併用）
  def search
    @books = Book.search(params[:keyword]).page(params[:page]).reverse_order
    @keyword = params[:keyword]
    render "search"
  end

  private

  def book_params
    params.require(:book).permit(:user_id, :title, :synopsis, :impression)
  end
end
