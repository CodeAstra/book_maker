class AuthorshipsController < ApplicationController
  before_action :fetch_book
  before_action :fetch_authorship, only: [:update, :destroy]

  def create
    invitee_email = params[:authorship][:invitee_email]
    if ValidateEmail.validate(invitee_email)
      @invitee = User.where(email: invitee_email).first
      if @invitee.nil?
        flash.now[:danger] = I18n.t('flash_messages.authorships.non_existing_user')
      elsif @invitee.contributing_to?(@book, true)
        flash.now[:danger] = I18n.t('flash_messages.authorships.already_contributor')
      else
        @book.authorships.create(invitee: @invitee, inviter: current_user)
        flash.now[:success] = I18n.t('flash_messages.authorships.invite_success')
      end
    else
      @invalid_email = true
    end
  end

  def update
    @authorship.accept!
    flash[:success] = I18n.t('flash_messages.authorships.accepted')
    redirect_to root_path
  end

  def destroy
    @authorship.destroy
    flash[:success] = I18n.t('flash_messages.authorships.rejected')
    redirect_to root_path
  end

private
  def fetch_book
    @book = Book.find(params[:book_id])
  end

  def fetch_authorship
    @authorship = @book.authorships.find(params[:id])
  end
end
