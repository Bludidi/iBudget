class Item < ApplicationRecord
  belongs_to :user
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  validates :name, :user_id, presence: true
  validates :amount, numericality: true
end
