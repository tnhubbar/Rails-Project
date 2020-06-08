class User < ApplicationRecord
    has_secure_password
    has_many :routines
    has_many :categories, through: :routines
    validates :name, presence: true

end
