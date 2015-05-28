class Receipt < ActiveRecord::Base
  validates :header, :footer, :user_id, presence: true
  validates :receipt_number, numericality: { greater_than_or_equal_to: 0 },
                    presence: true
  belongs_to :user
end
