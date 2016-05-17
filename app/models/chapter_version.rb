# == Schema Information
#
# Table name: chapter_versions
#
#  id              :integer          not null, primary key
#  book_version_id :integer
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ChapterVersion < ActiveRecord::Base
  has_many :sections, class_name: SectionVersion.name, dependent: :destroy
end
