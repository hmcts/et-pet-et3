require 'govuk_elements_form_builder/form_builder'

class FormBuilder < GovukElementsFormBuilder::FormBuilder

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    add_error_to_html_tag! html_tag, instance
  end

  def self.error_full_message_for attribute, object_name, object
     object.errors.full_messages_for(attribute).first
  end
end