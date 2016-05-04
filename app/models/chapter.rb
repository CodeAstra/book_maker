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
#  position   :integer
#

class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :sections

  default_scope {order(position: :asc)}

  validates :title, presence: true

  before_create :set_position

private
  def set_position
    self.position = (self.book.chapters[-2].try(:position) || 0) + 1
  end
end
