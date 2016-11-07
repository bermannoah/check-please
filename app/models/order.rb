class Order < ApplicationRecord
  validates :total, presence: true
  validates :server_id, presence: true


  belongs_to :server, optional: true, dependent: :destroy
  has_many :order_items
  has_many :items, through: :order_items
  enum status: [:ordered, :paid, :cancelled, :completed]

  def prep_for_show
    grouped_items = items.group_by {|item| item.id}
    a = grouped_items.reduce([]) do |array, (quantity, item) |
      array << [item.first, item.count, (item.first.price * item.count)]
      array
    end
  end

  def completed_or_cancelled?
    true ? self.status == "completed" || self.status == "cancelled" : false
  end

  def statuses
    [:ordered, :paid, :cancelled, :completed]
  end

  def status_count
    Order.group(:status).count
  end
end
