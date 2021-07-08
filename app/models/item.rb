class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :status

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :days_to_ship_id
      validates :prefecture_id
      validates :shipping_charge_id
      validates :status_id
    end
  end
end
