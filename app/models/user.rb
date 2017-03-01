class User < ApplicationRecord
  has_secure_password
  has_many :groups
  has_many :joins, dependent: :destroy
  has_many :groups, through: :joins
    validates :f_name, :l_name, :email, :password, presence: true
end
