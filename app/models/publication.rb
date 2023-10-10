class Publication < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :user
end
