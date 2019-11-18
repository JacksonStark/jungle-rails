class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { without: /\s/ }

  validates :password, length: { minimum: 6 }



  def self.authenticate_with_credentials(email, password)
    @user = User.where("lower(email) = lower(?)", email.split).first
    if @user
      return @user
    else
      return nil
    end
  end
end
