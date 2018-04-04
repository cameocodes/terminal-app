require 'slack-notifier'
require 'smarter_csv'
require 'pry'
require 'slack-ruby-client'
require_relative 'title'
require_relative 'upload_challenge'
require_relative 'menu'
require_relative 'post_challenge'
require_relative 'challenges'



title



def main_screen 
    challenges_array = init_convert_csv
    post_menu
    user_response = gets.chomp.to_i
    user_choice(challenges_array, user_response)
end

main_screen
