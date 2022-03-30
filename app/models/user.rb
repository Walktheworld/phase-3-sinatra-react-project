class User < ActiveRecord::Base
    has_many :recipes
    validates :username, :email, presence: true, uniqueness: true

end