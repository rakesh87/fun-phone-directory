$:.unshift File.dirname(__FILE__)


require 'test_helper'
require_relative '../lib/fun_phone_directory/string_parser'

describe FunPhoneDirectory::StringParser do

  it "include a function input_string_format returns the format for the unknown string" do
    string_parser = FunPhoneDirectory::StringParser.new('sdfghjky')
    string_parser.input_string_format.must_equal :string_format
  end

  it "function return number_format" do
    string_parser = FunPhoneDirectory::StringParser.new('1800-001')
    string_parser.input_string_format.must_equal :number_format
  end

  it "function string_parser return :file_format" do
    string_parser = FunPhoneDirectory::StringParser.new('spec/input-numbers.text')
    string_parser.input_string_format.must_equal :file_format
  end

end

