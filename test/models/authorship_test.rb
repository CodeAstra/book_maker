# == Schema Information
#
# Table name: authorships
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  invitee_id :integer
#  inviter_id :integer
#  accepted   :boolean          default("f")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AuthorshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
