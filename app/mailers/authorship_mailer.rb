class AuthorshipMailer < ApplicationMailer
  def invite(user, authorship)
    @user = user
    @authorship = authorship
    @url  = root_url
    mail(to: @user.email, subject: "Invitation to co-author the book '#{@authorship.book.title}'")
  end
end
