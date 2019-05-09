class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :password, length: { minimum: 6 }, on: :create
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false }

  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email: email)
    if @user && user.authenticate(password)
      @user
    else
      nil
    end
  end

end
