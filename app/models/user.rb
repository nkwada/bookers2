class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :username, presence: true, uniqueness: true, length: {maximum: 50}

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
