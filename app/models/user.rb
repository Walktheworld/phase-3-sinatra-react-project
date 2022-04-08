class User < ActiveRecord::Base
    has_many :recipes, dependent: :destroy
    validates :username, :email, presence: true, uniqueness: true

end