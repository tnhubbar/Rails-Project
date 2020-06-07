class Category < ApplicationRecord
    has_many :workout_routines
    has_many :users, through: :workout_routines
end
