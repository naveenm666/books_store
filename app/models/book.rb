class Book < ApplicationRecord
    belongs_to :supplier
    belongs_to :author
    has_many :reviews
    has_and_belongs_to_many :orders, join_table: 'books_orders'
    has_one_attached :avatar

  
    validates :title, presence: true
    validates :year_published, presence: true, inclusion: { in: (Date.current.year - 100)..Date.current.year }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :out_of_print, inclusion: { in: [true, false] }
    validates :author_id, presence: true
    validates :supplier_id, presence: true

  end
  