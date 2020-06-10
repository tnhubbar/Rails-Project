class User < ApplicationRecord
    has_secure_password
    has_many :routines
    has_many :categories, through: :routines
    has_many :exercises, through: :routines 
    validates :name, presence: true
    validates :username, uniqueness: true
end
