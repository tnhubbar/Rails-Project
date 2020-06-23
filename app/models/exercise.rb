class Exercise < ApplicationRecord
    belongs_to :routine 
    validates :name, presence: true
end
