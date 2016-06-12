require 'thor'
require_relative 'dictionary'
require_relative 'string_parser'

module FunPhoneDirectory
  class InputParser

    def initialize(input_data_array)
      @input_data_array = input_data_array
    end

    attr_reader :input_data_array

    def words_combinations
      result_hash = {}
      input_data_array.each do | input_digit_string |
        result_hash[input_digit_string] = digits_to_word_for(input_digit_string)
      end
      result_hash
    end


    private

      def digits_to_word_for(input_digits)
        words_result_array = []
        starting_words_array = []

        dictionary_encoding(0, words_result_array, starting_words_array, input_digits) if input_digits.size > 0
        
        words_result_array
      end

      def dictionary_encoding(starting_index=0, words_result_array, starting_words_array, input_digits_string)

        return words_result_array.push(starting_words_array.join) if (starting_index === input_digits_string.size)

        dictionary_mapping_string = Dictionary.mapping_with_unknown(input_digits_string[starting_index])
        
        dictionary_mapping_string.each_char do |string_char, i|
          starting_words_array.push(string_char)
          dictionary_encoding(starting_index + 1, words_result_array, starting_words_array, input_digits_string)
          starting_words_array.pop
        end

      end

  end
end