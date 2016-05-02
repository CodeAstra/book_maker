class Section < ActiveRecord::Base
  belongs_to :chapter

  validates :title, presence: true
end
