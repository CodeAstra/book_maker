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
  validates :title, presence: true
end
