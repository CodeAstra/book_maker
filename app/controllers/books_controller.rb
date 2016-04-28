class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if params[:title_confirmation].downcase == @book.title.downcase
      @book.destroy
      flash[:success] = I18n.t('flash_messages.books.deletion_success')
      redirect_to books_path
    else
      flash[:danger] = I18n.t('flash_messages.books.deletion_failure')
      redirect_to book_path(@book)
    end
  end

private
  def book_params
    params.require(:book).permit(:title, :notes)
  end

  def fetch_book
    @book = Book.find(params[:id])
  end
end
