# Preview all emails at http://localhost:3000/rails/mailers/enterprise_mailer
class EnterpriseMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    user = Enterprise.first
    token = 'fake_token'

    ::Devise::Mailer.confirmation_instructions(user, token)
  end

  def reset_password_instructions
    user = Enterprise.first
    token = 'fake_token'

    ::Devise::Mailer.reset_password_instructions(user, token)
  end

end
