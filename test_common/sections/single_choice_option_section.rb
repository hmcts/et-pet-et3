module ET3
  module Test
    module SingleChoiceOptionSection
      extend ActiveSupport::Concern

      included do
        include I18n
        section :yes, :gds_multiple_choice_option, 'components.single_choice_option_section.yes', exact: false do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end

        section :no, :gds_multiple_choice_option, 'components.single_choice_option_section.no', exact: false do
          element :selector, :css, 'input[type="radio"]'

          delegate :set, to: :selector
        end
      end

      def get
        if yes.has_checked_field?
          t('components.single_choice_option_section.yes')
        elsif no.has_checked_field?
          t('components.single_choice_option_section.no')
        else
          nil
        end
      end

    end
  end
end