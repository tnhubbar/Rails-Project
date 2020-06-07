class User < ApplicationRecord
    has_secure_password
    has_many :routines
    has_many :categories, through: :routines

end
