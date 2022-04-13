class Recipe < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :ingredients, presence: true
    validates :directions, presence: true

        #set local variable inside of instance method (name instance  cannot see the new_name local variable, only available within the single instance method)
    # def name=(recipe_name)
    #     new_name = recipe_name
    # end
    # def name
    #     new_name 
    # end

        #set instance variable with @ to make available in the scope of all instances within class 
        # By changing the local variable new_name to an instance variable @this_dogs_name, we've effectively changed its scope: instead of only being available to the method it's defined in, it's now available to all instance methods defined within the class. 
    # def name=(recipe_name)
    #     @new_name = recipe_name
    # end
    # def name
    #     @new_name 
    # end

    



end

