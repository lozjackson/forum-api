require 'jwt'

class Auth

  ALGORITHM = 'HS256'

  def self.issue(payload)
    iss = Time.now.to_i
    exp = 4 * 3600
    payload[:iss] = iss
    payload[:exp] = iss + exp
    JWT.encode(payload, auth_secret, ALGORITHM)
  end

  def self.decode(token)
    begin
      JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
    rescue #JWT::ExpiredSignature
      'FAILED'
    end
  end

  def self.auth_secret
    ENV["AUTH_SECRET"]
  end
end
