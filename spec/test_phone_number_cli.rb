
$:.unshift File.dirname(__FILE__)


require 'test_helper'
require_relative '../lib/fun_phone_directory/string_parser'
require_relative '../lib/fun_phone_directory/phone_number_cli'

describe FunPhoneDirectory::PhoneNumberCLI do

  describe "input_options_string" do
    it "is valid input" do
      
    end
  end

  describe "input_string_from_console" do
    it "is valid input" do
      
    end
  end

  it "return path string from the options" do
    cli_object = MiniTest::Mock.new
    cli_object.expect(:input_options_string, "/path/to/file")
  end

end

