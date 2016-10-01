class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true,
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
  validates :password, :password_confirmation, presence: true, on: :create

  def name
    email.split('@')[0]
  end
end
