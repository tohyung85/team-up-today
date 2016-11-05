class CustomFailure < Devise::FailureApp
  def redirect_url
    flash[:alert] = 'Invalid login or password!'
    root_path
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
