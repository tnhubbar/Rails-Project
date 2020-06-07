class User < ApplicationRecord
    has_secure_password
    has_many :workout_routines
    has_many :categories, through: :workout_routines

end
