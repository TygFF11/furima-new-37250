class Item < ApplicationRecord
  validates :item_name,         presence: true
  validates :item_describe,     presence: true
  validates :item_price,        
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :image,             presence: true
  
  validates :category_id,       numericality: { other_than: 1 , message: "can't be blank" }
  validates :situation_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivary_id,       numericality: { other_than: 1 , message: "can't be blank" }
  validates :day_id,            numericality: { other_than: 1 , message: "can't be blank" }
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivary
  belongs_to_active_hash :day
  
end
