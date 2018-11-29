module ET3
  module Test
    class PersonasRepository

      def initialize
        self.registry = {}
      end

      # Fetch a persona
      # @param [String] name The name of the persona to fetch
      # @return [OpenStruct] An open struct version of the hash stored in the persona
      def fetch(name)
        ensure_loaded
        OpenStruct.new registry.fetch(name)
      end

      private

      def personas_file
        language_suffix = ::ET3::Test::Messaging.instance.current_locale == :cy ? :cy : :en
        File.absolute_path("../fixtures/personas_#{language_suffix}.yml", __FILE__)
      end

      def ensure_loaded
        load unless loaded?
      end

      def loaded?
        loaded
      end

      def load
        self.registry = YAML.safe_load(ERB.new(File.read(personas_file)).result).symbolize_keys
        self.loaded = true
      end

      attr_accessor :registry, :loaded
    end
  end
end
