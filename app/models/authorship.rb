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

class Authorship < ActiveRecord::Base
  belongs_to :invitee, class_name: User.name
  belongs_to :inviter, class_name: User.name
  belongs_to :book

  attr_accessor :invitee_email, :skip_invitation_email

  after_create :send_authorship_invitation_email

  def accept!
    self.update_attribute(:accepted, true)
  end

private
  def send_authorship_invitation_email
    return if self.skip_invitation_email
    AuthorshipMailer.invite(self.invitee, self).deliver_now
  end
end
