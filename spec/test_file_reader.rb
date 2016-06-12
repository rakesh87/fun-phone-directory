
$:.unshift File.dirname(__FILE__)


require 'test_helper'
require_relative '../lib/fun_phone_directory/file_reader'

describe FunPhoneDirectory::FileReader do

	before (:each) do
		@file_reader = FunPhoneDirectory::FileReader.new('spec/input-numbers.text')
	end

	describe "#result_string_array" do
		it "returns an Array kind of" do
	    @file_reader.result_string_array.must_be_kind_of Array
	  end

	  it "returns an array of string values from the input file lines" do
	    @file_reader.result_string_array.must_equal ["1200", "4567", "456789"]
	  end
	end
end