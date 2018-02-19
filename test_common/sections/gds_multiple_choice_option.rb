module ET3
  module Test
    module GdsMultipleChoiceOptionSection
      extend ActiveSupport::Concern

      included do
        element :checkbox, 'input[type=checkbox]'
        element :label, 'label'
        # delegate :disabled?, to :checkbox
        # delegate :checked?, to :checkbox
        delegate :text, to: :label
      end

      # populate
    end
  end
end
