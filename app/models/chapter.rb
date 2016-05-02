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
  belongs_to :book
  has_many :sections

  validates :title, presence: true
end
