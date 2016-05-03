# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  title      :string
#  notes      :text
#  content    :text
#  chapter_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Section < ActiveRecord::Base
  belongs_to :chapter

  validates :title, presence: true
end
