class Review < ApplicationRecord
    belongs_to :customer
    belongs_to :book
    
    validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validates :customer_id, presence: true
    validates :body, presence: true

    enum :state, [:not_reviewed, :published, :hidden]
    
  end
  