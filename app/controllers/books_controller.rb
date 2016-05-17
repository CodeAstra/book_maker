class BooksController < ApplicationController
  before_action :fetch_book, only: [:destroy, :edit, :update]

  def index
    @books = current_user.authoring_books
    @invitations = current_user.authorship_invitations
    @new_book = Book.new
  end

  def new
    @book = current_user.owned_books.new
    authorize! :create, @book
  end

  def create
    @book = current_user.owned_books.new(book_params)
    authorize! :create, @book
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = current_user.authoring_books.includes(:versions).find(params[:id])
    authorize! :read, @book

    @chapters = @book.chapters.includes(:sections).all
    @new_chapter = @book.chapters.new
    @new_sections = {}
    @chapters.each do |chapter|
      @new_sections[chapter.id] = chapter.sections.new
    end
    @new_authorship = @book.authorships.new
    @new_book_version = @book.versions.new
  end

  def preview
    @book = current_user.authoring_books.includes(chapters: [:sections]).find(params[:id])
    authorize! :read, @book
  end

  def update
    authorize! :update, @book

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
    authorize! :destroy, @book

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
    authorize! :update, @book
  end

private
  def book_params
    params.require(:book).permit(:title, :notes, :sorted_chapter_ids)
  end

  def fetch_book
    @book = current_user.authoring_books.find(params[:id])
  end
end
