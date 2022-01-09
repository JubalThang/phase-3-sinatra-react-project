class Category < ActiveRecord::Base 
    belongs_to :book 
    has_many :authors, through: :books 
end