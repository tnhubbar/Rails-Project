class Category < ApplicationRecord
    has_many :routines
    has_many :users, through: :routines
    accepts_nested_attributes_for :routines 

end
