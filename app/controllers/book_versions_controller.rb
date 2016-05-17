class BookVersionsController < ApplicationController
  before_action :fetch_book

  def create
    @book_version = @book.versions.new

    authorize! :create, @book_version
    @book_version.save!
    redirect_to book_path(@book)
  end

  def show
    @book_version = @book.versions.includes(chapters: :sections).find(params[:id])

    authorize! :read, @book_version
    render 'books/preview'
  end

private
  def fetch_book
    @book = current_user.authoring_books.find(params[:book_id])
  end
end
