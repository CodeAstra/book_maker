class ChaptersController < ApplicationController
  before_action :fetch_book

  def create
    @chapter = @book.chapters.new(chapter_params)
    @save_success = !!@chapter.save
  end

private
  def fetch_book
    @book = Book.find(params[:book_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :notes)
  end
end
