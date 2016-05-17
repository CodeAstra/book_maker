# == Schema Information
#
# Table name: section_versions
#
#  id                 :integer          not null, primary key
#  chapter_version_id :integer
#  title              :string
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class SectionVersion < ActiveRecord::Base
  belongs_to :chapter_version
end
