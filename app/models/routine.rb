class Routine < ApplicationRecord
    belongs_to :user
    belongs_to :category 
    has_many :exercises
    accepts_nested_attributes_for :exercises
    scope :by_duration, -> (duration){ where("duration <= ?", duration) }
    validates :name, :duration, :description, presence: true
    validates :name, uniqueness: true 

    


    def category_attributes=(attr)
        category = Category.find_or_create_by(attr)
        self.category= category
    end 

    def self.by_category(category_id)
        where(category: category_id)
    end 

    def self.search(search_name)
        search_name = "%" + search_name + "%"
        self.where("name LIKE ?", search_name)
    end 

end