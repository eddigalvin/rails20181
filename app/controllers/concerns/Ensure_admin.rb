module Ensure_admin
    private
    def ensure_admin
        unless current_user and current_user.admin
        render :text => "Access Error Message", :status => :unauthorized
        end
    end
end