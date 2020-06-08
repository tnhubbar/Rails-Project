class Routine < ApplicationRecord
    belongs_to :user
    belongs_to :category 
    has_many :exercises
    accepts_nested_attributes_for :category, :exercises
end
