class ChaptersController < ApplicationController
  before_action :fetch_book
  before_action :fetch_chapter, only: [:edit, :update, :destroy]

  def create
    @chapter = @book.chapters.new(chapter_params)
    @save_success = !!@chapter.save
    @new_sections = { @chapter.id => @chapter.sections.new }
  end

  def edit
  end

  def update
    @chapter.update_attributes(chapter_params)
    @chapter.reload unless @chapter.valid?
    @new_sections = { @chapter.id => @chapter.sections.new }
  end

  def destroy
    if @chapter.sections.any?
      flash[:danger] = I18n.t('flash_messages.chapters.deletion_failure')
      @destroy_failed = true
    else
      @chapter.destroy
    end
  end

private
  def fetch_book
    @book = Book.find(params[:book_id])
  end

  def fetch_chapter
    @chapter = @book.chapters.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :notes)
  end
end
