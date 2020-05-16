class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    validates :birth_date, :color, :name, :sex, :description, presence: true 
    CAT_COLORS = ["black", "brown", "white", "orange"]
    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: ["M", "F"]

    def age
        time_ago_in_words(birth_date)
    end
end