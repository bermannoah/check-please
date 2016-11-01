require 'rails_helper'

# RSpec.describe Order, type: :model do
#   describe 'validations' do
#     context "invalid attributes" do
#       it "cannot be created without a location" do
#         order = Order.new
#
#         expect(order).to be_invalid
#       end
#
#       it "cannot be created without a unique location" do
#         Order.create(location: "1")
#         order = Order.new(location: "1")
#
#         expect(order).to be_invalid
#       end
#     end
#
#     context "valid attribtues" do
#       it "is valid with all attributes" do
#         order = Order.new(location: "1")
#
#         expect(order).to be_valid
#       end
#     end
#   end
#
#   describe "relationships" do
#     it "belongs to a server" do
#       order = Order.new(location: "1")
#
#       expect(order).to respond_to(:server)
#     end
#
#     it "has many items" do
#       order = Order.new(location: "1")
#
#       expect(order).to respond_to(:order_items)
#     end
#   end
# end
