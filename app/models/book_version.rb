# == Schema Information
#
# Table name: book_versions
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookVersion < ActiveRecord::Base
  has_many :chapters, class_name: ChapterVersion.name, dependent: :destroy
  belongs_to :book

  before_create :copy_data_from_book

  def version_no
    self.created_at.strftime("%c")
  end

private
  def copy_data_from_book
    self.title = self.book.title
    self.book.chapters.each do |original_chapter|
      chapter_version = self.chapters.new
      chapter_version.title = original_chapter.title
      original_chapter.sections.each do |original_section|
        section_version = chapter_version.sections.new
        section_version.title = original_section.title
        section_version.content = original_section.content
      end
    end
  end
end
