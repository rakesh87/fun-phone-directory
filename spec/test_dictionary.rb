
$:.unshift File.dirname(__FILE__)


require 'test_helper'
require_relative '../lib/fun_phone_directory/dictionary'

describe FunPhoneDirectory::Dictionary do


  describe "#FunPhoneDirectory::Dictionary.mapping hash function for default dictionary" do

    before (:each) do
      @mapping = FunPhoneDirectory::Dictionary.mapping
    end

    it "include a function mapping return Hash data" do
      @mapping.must_be_kind_of Hash
    end

    it "function mapping should have the desired values for key 2" do
      @mapping['2'].must_equal 'ABC'
    end

    it "function mapping should have the desired values for key 3" do
      @mapping['3'].must_equal 'DEF'
    end

    it "function mapping should have the desired values for key 4" do
      @mapping['4'].must_equal 'GHI'
    end

    it "function mapping should have the desired values for key 5" do
      @mapping['5'].must_equal 'JKL'
    end

    it "function mapping should have the desired values for key 6" do
      @mapping['6'].must_equal 'MNO'
    end

    it "function mapping should have the desired values for key 7" do
      @mapping['7'].must_equal 'PQRS'
    end

    it "function mapping should have the desired values for key 8" do
      @mapping['8'].must_equal 'TUV'
    end

    it "function mapping should have the desired values for key 9" do
      @mapping['9'].must_equal 'WXYZ'
    end

  end

  describe "#FunPhoneDirectory::Dictionary.mapping_with_unknown hash function for unknown dictionary key" do
    
    it "should return unknown key as it is" do
      FunPhoneDirectory::Dictionary.mapping_with_unknown('unknown').must_equal 'unknown'
    end

    it "should return unknown key as it is" do
      FunPhoneDirectory::Dictionary.mapping_with_unknown('@').must_equal '@'
    end

    it "should return unknown key as it is" do
      FunPhoneDirectory::Dictionary.mapping_with_unknown('#').must_equal '#'
    end

    it "should return unknown key as it is" do
      FunPhoneDirectory::Dictionary.mapping_with_unknown('!').must_equal '!'
    end

    it "should return unknown key as it is" do
      FunPhoneDirectory::Dictionary.mapping_with_unknown('$').must_equal '$'
    end

    it "should return unknown key as it is" do
      FunPhoneDirectory::Dictionary.mapping_with_unknown('.').must_equal '-'
    end
    
  end

end

