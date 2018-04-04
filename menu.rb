def post_menu
    system "clear"
    title
    puts """
    Welcome to the Challenge Bot! What would you like to do today?
        1. Post Challenge
        2. Upload Challenges 
        3. Exit
        """
end

def user_choice (challenges_array, response)
    system "clear"
    title
    case response
        when 1
            filter_by_topic(challenges_array)
        when 2
            upload_menu(challenges_array)
        when 3
            exit
        end
    end