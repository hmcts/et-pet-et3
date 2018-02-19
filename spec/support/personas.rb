module ET3
  module Test
    module PersonasHelper
      def personas
        @personas ||= ::ET3::Test::PersonasRepository.new
      end
    end
  end
end

RSpec.configure do |c|
  c.include ::ET3::Test::PersonasHelper
end
