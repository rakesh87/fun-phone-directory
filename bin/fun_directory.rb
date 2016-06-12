#!/usr/bin/env ruby

$: << File.join(File.expand_path(File.dirname($0)), '..', 'lib')

ENV['BUNDLE_GEMFILE'] = File.join(File.expand_path(File.dirname($0)), '..', 'Gemfile')

require 'bundler'
Bundler.setup

require 'fun_phone_directory'

# run application
FunPhoneDirectory.run
