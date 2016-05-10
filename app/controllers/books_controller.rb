class BooksController < ApplicationController
  before_action :fetch_book, only: [:show, :destroy, :edit, :update]

  def index
    @books = current_user.owned_books
  end

  def new
    @book = current_user.owned_books.new
  end

  def create
    @book = current_user.owned_books.new(book_params)
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
    @new_authorship = @book.authorships.new
  end

  def update
    if @book.update_attributes(book_params)
      if params[:book][:sorted_chapter_ids]
        render nothing: true
      else
        flash[:success] = I18n.t('flash_messages.books.updation_success')
        redirect_to book_path(@book)
      end
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
    params.require(:book).permit(:title, :notes, :sorted_chapter_ids)
  end

  def fetch_book
    @book = current_user.owned_books.find(params[:id])
  end
end
