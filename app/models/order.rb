class Order < ApplicationRecord
  validates :total, presence: true
  validates :server_id, presence: true
  
  
  belongs_to :server, optional: true, dependent: :destroy
  has_many :order_items
  has_many :items, through: :order_items
  
  def prep_for_show
    grouped_items = items.group_by {|item| item.id}
    a = grouped_items.reduce([]) do |array, (quantity, item) |
      array << [item.first.name, item.count, (item.first.price * item.count)]
      array
    end
  end
end
