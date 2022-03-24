class User < ActiveRecord::Base
    has_many :recipes, dependent: :destroy
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
end