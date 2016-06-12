require 'thor'
require_relative 'string_parser'
require_relative 'input_parser'

module FunPhoneDirectory
  class PhoneNumberCLI < Thor

    default_task :read_input
    desc "read_input", "Asks user to enter phone number digits"

    method_option :file_path, type: :string, :aliases => '-f'

    def read_input
      input_file_path = input_options_string
      raw_input_string = 
      if input_file_path
        input_file_path
      else
        input_string_from_console
      end
      string_parser = StringParser.new(raw_input_string)
      input_parser = InputParser.new(string_parser.call_reader)
      puts "###############################################"
      puts 
      input_parser.words_combinations.each do | key, values |
        puts "Input Number: #{key}"
        puts "Possible Words List:"
        puts values
        puts 
      end
      puts "###############################################"
    end


    no_commands {

      def input_options_string
        options[:file_path]
      end

      def input_string_from_console
        ask("Please enter the phone number (example: 080-400 ) :")
      end  
    }

  end
end

