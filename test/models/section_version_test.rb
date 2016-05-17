# == Schema Information
#
# Table name: section_versions
#
#  id                 :integer          not null, primary key
#  chapter_version_id :integer
#  title              :string
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class SectionVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
