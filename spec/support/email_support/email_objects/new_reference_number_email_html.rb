module ET3
  module Test
    module EmailObjects
      class NewReferenceNumberEmailHtml < SitePrism::Page
        include ET3::Test::I18n

        def self.find(repo: ActionMailer::Base.deliveries, reference:)
          instances = repo.map { |mail| new(mail) }
          instances.detect { |instance| instance.has_correct_subject? && instance.has_reference_element?(reference) }
        end

        def initialize(mail)
          self.mail = mail
          part = mail.parts.detect { |p| p.content_type =~ %r{text\/html} }
          body = part.nil? ? '' : part.body.to_s
          load(body)
        end

        def has_correct_subject?
          mail.subject == t('mailer.access_details_email.subject')
        end

        def has_reference_element?(reference)
          reference_number.has_value?(text: reference)
        end

        attr_accessor :mail

        section :reference_number, :table_row_with_td_labelled, 'mailer.reference_number', exact: false do
          element :value, :css, 'p:last-child'
        end
      end
    end
  end
end