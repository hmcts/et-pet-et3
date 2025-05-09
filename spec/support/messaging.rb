require 'i18n'
module ET3
  module Test
    # @private
    class Backend < ::I18n::Backend::Simple
      def initialize(messaging_dir:)
        super()
        load_translations Dir.glob(File.join(messaging_dir, '**', '*.yml'))
        @initialized = true
      end
    end

    # A singleton class for translating i18n keys in the test suite.
    # This is to allow the test suite to have its own i18n yml files so that
    # all 'language' or 'messaging' that the test suite must use (e.g. button text to click on)
    # is defined in a common file for each language (or even multiple files).
    class Messaging
      include Singleton
      # Translates using the current locale
      # @param [Symbol] key The key to use to lookup the text from the language file(s)
      # @param [Symbol] locale - The locale to use (defaults to the result of #current_locale)
      # @see #current_locale
      # @param [Hash] options - Any options that the translation requires
      # @return [String] The translated text
      # @raise [::I18n::MissingTranslation] If the translation was not found
      def translate(key, locale: current_locale, **options)
        result = catch(:exception) do
          backend.translate(locale, key, options)
        end
        result.is_a?(::I18n::MissingTranslation) ? raise(result) : result
      end

      # Provides the current_locale which is the default for the #translate method
      # The current locale is determined from the special environment variable
      # 'TEST_LOCALE' - which defaults to :en
      #
      # @return [Symbol] The current locale
      def current_locale
        Thread.current[:et3_test_current_locale] ||= ENV.fetch('TEST_LOCALE', 'en').to_sym
      end

      alias t translate

      private

      def initialize(messaging_dir: File.absolute_path('../messaging', __FILE__))
        self.backend = Backend.new(messaging_dir: messaging_dir)
      end

      attr_accessor :backend
    end

    module I18n
      extend ActiveSupport::Concern

      private

      def t(*args, **kw_args)
        ::ET3::Test::Messaging.instance.t(*args, **kw_args)
      end

      def current_locale
        ::ET3::Test::Messaging.instance.current_locale
      end

      def current_locale_parameter
        ::ET3::Test::Messaging.instance.current_locale == :cy ? :cy : nil
      end

      def factory_translate(value, *args)
        return value unless value.is_a?(Symbol)

        t(value, *args)
      end

      class_methods do
        def t(*args, **kw_args)
          ::ET3::Test::Messaging.instance.t(*args, **kw_args)
        end

        def factory_translate(*args)
          ::ET3::Test::Messaging.instance.factory_translate(*args)
        end
      end
    end
  end
end

RSpec.configure do |c|
  c.include ET3::Test::I18n, type: :feature
end
