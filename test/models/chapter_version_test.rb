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

require 'test_helper'

class ChapterVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
