# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Send Reference Number Request', type: :request do

  let(:emails_sent) do
    Et3::Test::EmailsSent.new
  end

  shared_examples 'email validation using standard template' do
    it 'sends an HTML email to the respondent with a copy of his reference number' do
      email_sent = emails_sent.new_reference_number_html_email_for(reference: reference, template_reference: 'et3-v1-en')
      expect(email_sent).to have_correct_content_for(user_ui_factory, reference: reference)
    end

    it 'sends a plain text email to the respondent with the copy of his reference number' do
      email_sent = emails_sent.new_reference_number_text_email_for(reference: reference, template_reference: 'et3-v1-en')
      expect(email_sent).to have_correct_content_for(user_ui_factory, reference: reference)
    end
  end
end
