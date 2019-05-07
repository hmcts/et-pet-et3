module ET3
  module Test
    class StartPage < BasePage
      set_url '/'
      section :switch_language, LanguageSwitcherSection, '.switch-language'
      element :header, :content_header, "introduction.header"
      element :description, :element_with_text, "introduction.description"
      section :what_you_need, :wrapper_headered, "introduction.what_title" do
        element :header, :element_with_text, "introduction.what_title"
        element :bullet_one, :element_with_text, "introduction.what_content_1"
        element :bullet_two, :element_with_text, "introduction.what_content_2"
        element :bullet_three, :element_with_text, "introduction.what_content_3"
        element :bullet_four, :element_with_text, "introduction.what_content_4"
        element :bullet_five, :element_with_text, "introduction.what_content_5"
        element :bullet_six, :element_with_text, "introduction.what_content_6"
      end
      section :how_to_fill, :wrapper_headered, "introduction.how_title" do
        element :header, :element_with_text, "introduction.how_title"
        element :bullet_one, :element_with_text, "introduction.how_content_1"
        element :bullet_two, :element_with_text, "introduction.how_content_2"
        element :bullet_three, :element_with_text, "introduction.how_content_3"
      end
      section :dpa, :wrapper_headered, "introduction.data_title"do
        element :header, :element_with_text, "introduction.data_title"
        element :section_content, :element_with_text, "introduction.data_content"
      end
      element :start_button, :css, ".button.button-start"
      def next
        start_button.click
      end

      def switch_to_welsh
        switch_language.welsh_link.click
      end

      def switch_to_english
        switch_language.english_link.click
      end
    end
  end
end
