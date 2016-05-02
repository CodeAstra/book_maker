class SectionsController < ApplicationController
  before_action :fetch_chapter

  def create
    @section = @chapter.sections.new(section_params)
    @save_success = @section.save
  end

private
  def fetch_chapter
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.find(params[:chapter_id])
  end

  def section_params
    params.require(:section).permit(:title, :notes)
  end
end
