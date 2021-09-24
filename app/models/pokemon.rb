class Pokemon < ApplicationRecord
    self.inheritance_column = "not_sti"

    def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 
end
