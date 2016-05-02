class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :destroy, :edit, :update]

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
    @chapters = @book.chapters.includes(:sections).all
    @new_chapter = @book.chapters.new
    @new_sections = {}
    @chapters.each do |chapter|
      @new_sections[chapter.id] = chapter.sections.new
    end
  end

  def update
    if @book.update_attributes(book_params)
      flash[:success] = I18n.t('flash_messages.books.updation_success')
      redirect_to book_path(@book)
    else
      render :edit
    end
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

  def edit
  end

private
  def book_params
    params.require(:book).permit(:title, :notes)
  end

  def fetch_book
    @book = Book.find(params[:id])
  end
end
