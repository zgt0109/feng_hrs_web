class Enterprise::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  layout 'applicant_old'
  # GET /resource/sign_up
  def new
    unless %w(email mobile).include? params[:type]
     params[:type] = 'email'
   end
   super
  end


  def send_sms
    if params[:_rucaptcha] == session[:_rucaptcha]
      send_sms_message
    else
      render json: { error: true, msg: 'invalid captcha'}
    end
  end

  def send_sms_message
    if (params[:mobile] =~ Enterprise::MOBILE_REGEX)!=0
      render json: {error: 'mobile_incorrect'}
    else
      phone = params[:mobile]
      begin
        Sms.new.send(phone)
        render json: { success: true }
      rescue Exception => e
        render json: { error: true, msg: e.message }
      end
    end
  end


  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :attribute
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :name, :email, :mobile, :password, :remember_me, :email_signup,
        :mobile_signup, :password_confirmation
      )
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
