class User < ActiveRecord::Base
    has_many :recipes, dependent: :destroy
    validates :username, :email, presence: true, uniqueness: true


        #set local variable inside of instance method (name instance  cannot see the new_name local variable, only available within the single instance method)
    # def name=(recipe_name)
    #     new_name = recipe_name
    # end
    # def name
    #     new_name 
    # end

        #set instance variable with @ to make available in the scope of all instances within class 
        # By changing the local variable new_name to an instance variable @this_dogs_name, we've effectively changed its scope: instead of only being available to the method it's defined in, it's now available to all instance methods defined within the class. 
    # def name=(full_name)
    #     @new_name = full_name
    # end
    # def name
    #     @new_name 
    # end
    def introduction
        "Hello! My name is #{self.full_name} and I have contributed #{self.recipes.count} "
    end

    def find_specific_recipe(item_name)
        self.recipes.find do |recipe|
            recipe.name == item_name
        end
    end

    def has_recipe?
        self.recipes.any?
    end
    
    
end