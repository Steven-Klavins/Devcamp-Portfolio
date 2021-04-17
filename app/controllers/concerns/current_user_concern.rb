module CurrentUserConcern
    extend ActiveSupport::Concern

    # If current user (super) if false/nil use ostruct dummy data 
    def current_user 
        super || guest_user
    end

    def guest_user 
        OpenStruct.new(name: "Guest", 
                       first_name: "Guest", 
                       last_name: "User", 
                       email: "guest@rails.com")
    end
end