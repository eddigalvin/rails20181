class Product < ApplicationRecord
    has_many :orderitems
    
    def self.search(search)
       where("name LIKE ? OR manu LIKE ? OR procname LIKE ? OR desc LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%") 
    end
end
# t.string :name
 #     t.string :manu
  #    t.string :model
   #   t.text :desc
    #  t.string :procname