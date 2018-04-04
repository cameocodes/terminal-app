
def init_convert_csv
    SmarterCSV.process("./challenge_database.csv")
end

def convert_csv(challenges_array, path)
    file_to_convert = SmarterCSV.process(path)
    if file_to_convert
        adding_csv(challenges_array, file_to_convert)
    else
        "Error importing challenges. Please make sure all special characters are preceeded by an escape character (backslash)."
        upload_menu
    end
end

def adding_csv(challenges_array, add_to_database)
    system "printf '\n#{add_to_database}' >> challenge_database.csv"
        challenges_array.push(add_to_database)
        puts "Successfully imported challenges."
        upload_menu(challenges_array)
end
