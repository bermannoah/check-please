class Item < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  belongs_to :category, optional: true, dependent: :destroy
  has_many :ticket_items
  has_many :tickets, through: :ticket_items
  
  has_attached_file :avatar, styles: {
   thumb: '100x100>',
   square: '200x200>',
   medium: '300x300>'
  }

 # Validate the attached image is image/jpg, image/png, etc
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
