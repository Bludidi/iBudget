class Category < ApplicationRecord
  has_one_attached :icon
  belongs_to :user
  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories, dependent: :destroy
  validates :name, presence: true
  validates :icon, presence: true
end
