module ApplicationHelper
    def remove_element_if_route_on_list?
        whitelist = [
            new_user_registration_path.to_s,
            new_user_session_path.to_s,
        ]
        whitelist.include?(request.path)
    end
end
