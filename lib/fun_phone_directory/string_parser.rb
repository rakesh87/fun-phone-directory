$: << '.'

require_relative './file_reader'

module FunPhoneDirectory
  class StringParser

    ALPHABET_REGEX = /[a-z]/i

    def initialize(input_raw_string)
      @input_raw_string = input_raw_string
    end

    attr_reader :input_raw_string

    def call_reader
      case input_string_format
      when :file_format
        FileReader.new(input_raw_string).result_string_array
      when :number_format
        [input_raw_string]
      else
        raise "format not supported"
      end
    end

    def input_string_format
      if File.exist?(input_raw_string)
        :file_format
      elsif ALPHABET_REGEX.match(input_raw_string)
        :string_format
      else
        :number_format
      end
    rescue
      :unknown_format
    end

  end
end