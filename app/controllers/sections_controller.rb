class SectionsController < ApplicationController
  before_action :fetch_chapter
  before_action :fetch_section, only: [:show, :update, :destroy]

  def create
    @section = @chapter.sections.new(section_params)
    authorize! :create, @section

    @save_success = @section.save
  end

  def show
    authorize! :read, @section
  end

  def update
    authorize! :update, @section

    @section.update_attributes(section_params)
  end

  def destroy
    authorize! :destroy, @section

    if params[:title_confirmation].downcase == @section.title.downcase
      @destroy_success = true
      @section.destroy
      flash.now[:success] = I18n.t('flash_messages.sections.deletion_success')
    else
      flash.now[:danger] = I18n.t('flash_messages.sections.deletion_failure')
    end
  end

private
  def fetch_chapter
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.find(params[:chapter_id])
  end

  def fetch_section
    @section = @chapter.sections.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :notes, :content)
  end
end
