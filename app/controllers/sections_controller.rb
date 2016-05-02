class SectionsController < ApplicationController
  before_action :fetch_chapter

private
  def fetch_chapter
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.find(params[:chapter_id])
  end
end
