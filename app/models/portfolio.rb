class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # Custom scopes 
    def self.angular
        where(subtitle: "Angular") 
    end

    scope :ruby_on_rails_portfolio_items,  -> {where(subtitle: "Ruby on Rails")}
    # Set defaults for images 
    after_initialize :set_defaults
    
    def set_defaults
        self.main_image ||= "https://via.placeholder.com/600x400"
        self.thumb_image ||=  "https://via.placeholder.com/350x200"
    end
end

