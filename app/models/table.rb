class Table < ActiveRecord::Base
  validates :location, presence: true, uniqueness: true

  belongs_to :server, optional: true
end
