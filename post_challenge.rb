def filter_by_topic(challenges_array)
    puts """
    Choose a topic:
    1. Loops
    2. If/Else
    3. Arrays
    4. Methods
    5. Not Assigned
    6. Random Choice
    """
    user_input = gets.chomp.to_i
    case user_input
        when 1
            find_challenges(challenges_array, 1)
        when 2
            find_challenges(challenges_array, 2)
        when 3
            find_challenges(challenges_array, 3)
        when 4
            find_challenges(challenges_array, 4)
        when 5
            find_challenges(challenges_array,5)
        when 6
            find_challenges(challenges_array, 6)
        else puts "Please choose a number from 1 - 6"
            filter_by_topic(challenges_array)
        end
end

def find_challenges(challenges_array, filter)
    case filter
        when 1
            puts "#{filter}"
            results = challenges_array.select {|challenge| challenge[:topics] == 1 }
            challenge_results(challenges_array, results)
        when 2
            puts "#{filter}"
            results = challenges_array.select {|challenge| challenge[:topics] == 2 }
            challenge_results(challenges_array, results)
        when 3
            puts "#{filter}"
            results = challenges_array.select {|challenge| challenge[:topics] == 3 }
            challenge_results(challenges_array, results)
        when 4
            puts "#{filter}"
            results = challenges_array.select {|challenge| challenge[:topics] == 4 }
            challenge_results(challenges_array, results)
        when 5
            puts "#{filter}"
            results = challenges_array.select {|challenge| challenge[:topics] == 5 }
            challenge_results(challenges_array, results)
        when 6
            puts "#{filter}"
            results = challenges_array.select {|challenge| challenge[:topics]}
            challenge_results(challenges_array, results)
    end
end

def challenge_results(challenges_array, results)
    system "clear"
    title
    number_gen = Random.new
    random_number = number_gen.rand(results.length)
    challenge = results[random_number][:code].to_s
    
    puts """
    #{results.length} challenge/s match your search.
    Would you like to post this challenge?:
    
    #{challenge.gsub("*",",").gsub("&","'")}

    1. Post challenge to Slack
    2. View another challenge
    3. Return to Main Menu
    """
    user_input = gets.chomp.to_i
    case user_input
        when 1
            post_to_slack(challenge)
        when 2
            challenge_results(challenges_array, results)
        when 3
            main_screen
        end
end

def post_to_slack(challenge)
    # TEST WORKSPACE WEBHOOK
     notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" 
    # CA WORKSPACE WEBHOOK
    # notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    notifier.ping "Today's morning challenge:
    #{challenge.gsub("*",",").gsub("&","'")}"
    puts "Your challenge has been posted!"

end