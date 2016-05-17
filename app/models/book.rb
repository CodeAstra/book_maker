# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  has_many :authorships, dependent: :destroy
  has_many :versions, class_name: BookVersion.name, dependent: :destroy
  belongs_to :owner, class_name: User.name

  validates :title, presence: true
  validates :owner, presence: true

  after_create :add_owner_as_author

  def sorted_chapter_ids=(ids_array)
    ids_array = JSON.parse(ids_array)
    grouped_chapters = self.chapters.where(id: ids_array).group_by(&:id)
    index_no = 1
    ids_array.each do |chapter_id|
      chapter_id = chapter_id.to_i
      chapter = grouped_chapters[chapter_id][0]
      chapter.update_attribute(:position, index_no)

      index_no += 1
    end
  end

private
  def add_owner_as_author
    invite = self.authorships.new(invitee: self.owner, inviter: self.owner, accepted: true)
    self.owner.skip_authorship_invitation_email = true
    invite.save!
  end
end
