require_relative './fun_phone_directory/phone_number_cli'

module FunPhoneDirectory

	def self.run
		PhoneNumberCLI.start(ARGV)
	end
end