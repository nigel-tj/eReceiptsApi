class Receipt < ActiveRecord::Base
  has_many :receipt_items
  validates :header, :footer, presence: true
  validates :receipt_number, numericality: { greater_than_or_equal_to: 0 },
                    presence: true
  accepts_nested_attributes_for :receipt_items, :allow_destroy => true
  belongs_to :organisation

end
