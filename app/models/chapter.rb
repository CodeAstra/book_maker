# == Schema Information
#
# Table name: chapters
#
#  id         :integer          not null, primary key
#  title      :string
#  notes      :text
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chapter < ActiveRecord::Base
  validates :title, presence: true
end
