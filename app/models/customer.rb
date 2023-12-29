class Customer < ApplicationRecord
    has_many :orders
    has_many :reviews

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  end
  