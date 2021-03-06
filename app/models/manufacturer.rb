class Manufacturer < ApplicationRecord
    has_many :products
    has_many :reviews, through: :products 
    has_many :categories, through: :products

    def self.search(search) 
        if search != nil
            manufacturer = Manufacturer.find_by(name: search)
            if manufacturer
                self.where(id: manufacturer)
            else
                # if nothing is found
                Manufacturer.all.sort_by {|m| m.name}
            end 
        else 
            # if search is blank
            Manufacturer.all.sort_by {|m| m.name}
        end 
    end
end
