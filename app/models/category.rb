class Category < ApplicationRecord
  belongs_to :user
  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories, dependent: :destroy
  validates :name, presence: true
end
