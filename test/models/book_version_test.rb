# == Schema Information
#
# Table name: book_versions
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
