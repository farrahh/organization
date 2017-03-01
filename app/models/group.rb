class Group < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
    validates :name, :desc, presence: true
end
