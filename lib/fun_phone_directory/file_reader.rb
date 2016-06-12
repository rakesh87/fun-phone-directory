module FunPhoneDirectory
  class FileReader

    def initialize(file_path)
      @file_path = file_path
    end

    attr_reader :file_path

    def result_string_array
      string_array = []
      File.open(file_path, "r") do |f|
        f.each_line do |line|
          string_array << line.strip.chomp
        end
      end
      string_array.reject { |str| str.empty? }
    end

  end
end