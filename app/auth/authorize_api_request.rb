class AuthorizeApiRequest
  def initailize(headers = {})
    @headrs = headers
  end

  def call
    {
        uer: user
    }
  end

  private

  attr_reader :headrs

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decode_auth_token

  rescue ActiveRecord::RecordNotFound => e
   raise(
       ExceptionHandler::InvalidToken,
       ("#{Message.invalid_token} #{e.message}")
    )
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headrs['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
      raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end