
$:.unshift File.dirname(__FILE__)

require 'test_helper'
require_relative '../lib/fun_phone_directory/input_parser'

describe FunPhoneDirectory::InputParser do

	before (:each) do
    @input_parser1 = FunPhoneDirectory::InputParser.new(['100', '104'])
    @input_parser2 = FunPhoneDirectory::InputParser.new(['44', '666'])
  	@input_parser3 = FunPhoneDirectory::InputParser.new(['!2255.63'])
  end

  describe "#input_data_array" do

  	it "should have the array of input numbers" do
	    @input_parser1.input_data_array.must_be_kind_of Array
  	end

  	it "should have the same array which it has been initialized" do
	    @input_parser1.input_data_array.must_equal ['100', '104']
  	end

  end

  describe "#words_combinations" do

    it "should have the Hash type as a result" do
      @input_parser1.words_combinations.must_be_kind_of Hash
    end

    it "should have the hash data, hash key as input numbers and values as a possible words array -1" do
      @input_parser1.words_combinations.must_equal({ "100"=>["100"], "104"=> ["10G", "10H", "10I"] })
    end

    it "should have the hash data, hash key as input numbers and values as a possible words array -2" do
      @input_parser2.words_combinations.must_equal({"44"=>["GG", "GH", "GI", "HG", "HH", "HI", "IG", "IH", "II"], "666"=>["MMM", "MMN", "MMO", "MNM", "MNN", "MNO", "MOM", "MON", "MOO", "NMM", "NMN", "NMO", "NNM", "NNN", "NNO", "NOM", "NON", "NOO", "OMM", "OMN", "OMO", "ONM", "ONN", "ONO", "OOM", "OON", "OOO"]})
    end

    it "should have the hash data, hash key as input numbers and values as a possible words array -3" do
      @input_parser3.words_combinations["!2255.63"].must_include("!CALL-ME")
    end

  end

  #private methods

  describe "#private methods" do

    before (:each) do
      @words_result_array = []
      @starting_words_array = []
      @input_digits1 = "!2255.63"
      @input_digits2 = "5.63"
      @input_digits3 = "257"
    end

    describe "#" do
      it "should have the Hash type as a result" do
        @input_parser1.send(:dictionary_encoding, 0, @words_result_array, @starting_words_array, @input_digits1).must_equal '!'
        @input_parser1.send(:dictionary_encoding, 0, @words_result_array, @starting_words_array, @input_digits2).must_equal 'JKL'
        @input_parser1.send(:dictionary_encoding, 0, @words_result_array, @starting_words_array, @input_digits3).must_equal 'ABC'
      end
    end

    describe "#digits_to_word_for" do
      it "should give possible words for given input digits" do
        @input_parser1.send(:digits_to_word_for, @input_digits1).must_include("!CALL-ME")
        @input_parser1.send(:digits_to_word_for, @input_digits2).must_include("J-OE")
        @input_parser1.send(:digits_to_word_for, @input_digits3).must_include("AJP")
      end
    end

  end


end