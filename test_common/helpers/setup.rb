module ET3
  module Test
    module Setup

      attr_accessor :user

      def given_i_am(company_name)
        self.user = personas.fetch(company_name)
      end
    end
  end
end
