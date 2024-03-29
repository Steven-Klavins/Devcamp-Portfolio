module CurrentUserConcern
    extend ActiveSupport::Concern

    # If current user (super) if false/nil use ostruct dummy data 
    def current_user 
        super || guest_user
    end

    def guest_user 
        guest = GuestUser.new 
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@mysite.com"
        guest
    end
end