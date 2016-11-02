class ticketItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :item
end
