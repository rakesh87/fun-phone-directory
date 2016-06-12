module FunPhoneDirectory
  module Dictionary
    class << self

      def mapping
        {
          "2" => 'ABC',
          "3" => 'DEF',
          "4" => 'GHI',
          "5" => 'JKL',
          "6" => 'MNO',
          "7" => 'PQRS',
          "8" => 'TUV',
          "9" => 'WXYZ'
        }
      end

      def mapping_with_unknown(key)
        value = mapping[key]
        unless value
          if key.to_s == '.'
            return '-'
          else
            return key.to_s
          end
        end
        value
      end

    end
  end
end