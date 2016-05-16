class ChapterVersion < ActiveRecord::Base
  belongs_to :book_version
end
