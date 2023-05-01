class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :categories, dependent: :destroy
end
