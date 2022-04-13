class Recipe < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :ingredients, presence: true
    validates :directions, presence: true
end

