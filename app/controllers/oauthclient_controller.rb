class OauthclientController < PseudonymSessionsController

  def create
    omniauth = request.env['omniauth.auth']
    auth
  end

  def auth
    omniauth = request.env['omniauth.auth']['extra']['info']

    email = omniauth['email']
    name = omniauth['name'] + ' ' + omniauth['surname']
    uid = omniauth['id']
    gender = omniauth['gender']

    unique_id = uid.to_s + '@' + 'liot.mipt.ru'

    if (@pseudonym = Pseudonym.active.find_by_unique_id(email)) or
        (@pseudonym = Pseudonym.active.find_by_unique_id(unique_id))
      @domain_root_account.pseudonym_sessions.create!(@pseudonym, false)
      @user = @pseudonym.login_assertions_for_user

      return successful_login(@user, @pseudonym)
    else
      # create account, see UsersController#create
      @user ||= User.new

      @user.validation_root_account = @domain_root_account

      @user.name = name

      @pseudonym ||= @user.pseudonyms.build(:account => @domain_root_account)
      @pseudonym.require_password = false
      @pseudonym.user = @user

      @pseudonym.unique_id = unique_id

      @pseudonym.account = @domain_root_account
      @pseudonym.workflow_state = 'active'


      if @user.valid? && @pseudonym.valid?
        PseudonymSession.new(@pseudonym).save unless @pseudonym.new_record?
        @user.save!

        successful_login(@user, @pseudonym)
      else
        unsuccessful_login t('errors.invalid_credentials', "Incorrect username and/or password")
      end
    end
  end
end