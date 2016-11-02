class Order < ApplicationRecord

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def items
    # Item.where(id: @contents.keys)
    @contents.reduce({}) do |hash, (id,quantity)| 
      hash[Item.find(id)] = quantity
      hash
    end
  end

  def delete(item_id)
    @contents.delete(item_id)
  end

end
