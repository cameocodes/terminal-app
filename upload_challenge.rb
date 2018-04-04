def upload_menu(challenges_array)
    puts """
    1. Upload single challenge
    2. Upload .CSV file
    3. Back to Main Menu"""

    user_choice = gets.chomp.to_i
    case user_choice
        when 1
            upload_single_challenge(challenges_array)
        when 2
            system "clear"
            title
            puts """\nPlease enter .csv path in format ./path.csv. 
            
            UPLOAD GUIDELINES: Please replace all instances of quotation marks (\") with ampersands (&) and all instances of commas (,) with asterisk (*)."""
            file_path = gets.chomp
            convert_csv(challenges_array, file_path)
        when 3
            main_screen
        end
            
end

def upload_single_challenge(challenges_array)
    system "clear"
    title
    puts """
        What topic is your challenge?:
        1. Loops
        2. If/Else
        3. Arrays
        4. Methods
        5. Not Assigned
        """
    user_topic = gets.chomp.to_i
    
    system "clear"
    title 

    puts "Please enter your challenge:"
    user_code = gets.chomp.gsub(",","*").gsub("'","&")
    system "printf '\n#{user_topic}, #{user_code}' >> challenge_database.csv"
    challenges_array.push({topic: user_topic, code: user_code})
    single_upload_successful(challenges_array)
end

def single_upload_successful(challenges_array)
    system "clear"
    title
    puts """
    Challenge successfully added! What would you like to do?

        1. Upload another challenge
        2. Return to Main Menu"""
    user_response = gets.chomp.to_i
    if user_response == 1
            upload_single_challenge(challenges_array)
        elsif user_response == 2
            main_screen
        else puts "Please enter 1 or 2 only."
            single_upload_successful(challenges_array)
        end
end