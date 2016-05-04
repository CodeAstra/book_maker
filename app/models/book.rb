# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy

  validates :title, presence: true

  def sorted_chapter_ids=(ids_array)
    ids_array = JSON.parse(ids_array)
    grouped_chapters = self.chapters.where(id: ids_array).group_by(&:id)
    index_no = 1
    ids_array.each do |chapter_id|
      chapter_id = chapter_id.to_i
      chapter = grouped_chapters[chapter_id][0]
      chapter.update_attribute(:position, index_no)

      index_no += 1
    end
  end
end
