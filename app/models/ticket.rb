class Ticket < ApplicationRecord

  attr_reader :contents

  has_many :ticket_items
  has_many :items, through: :ticket_items
  belongs_to :server

  def initialize(initial_contents = nil)
    @contents = initial_contents || Hash.new
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def items
    @contents.reduce({}) do |hash, (id, quantity)|
      hash[Item.find(id.to_i)] = quantity
      hash
    end
  end

  def delete(item_id)
    @contents.delete(item_id.to_s)
  end

  def update_quantity(item_id, quantity)
    @contents[item_id.to_s] = quantity.to_i
    delete(item_id.to_s) if quantity.to_s == "0"
  end

  def total
    items.reduce(0) {|sum, (item,quantity)| sum += item.price*quantity.to_f}
  end

  def create_order_items(order_id)
    items.each {|item,quantity| quantity.to_i.times {OrderItem.create(item_id:item.id, order_id:order_id)}}
  end

end
