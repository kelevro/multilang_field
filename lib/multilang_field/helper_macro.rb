module MultilangField
  module HelperMacro
    def nested_multilang_wrapper(form, attribute, &block)
      languages = I18n.available_locales
      render 'multilang_field/nested_wrapper',
              attribute: attribute,
              form: form,
              block: block,
              languages: languages
    end

    def multilang_wrapper(attribute, label = nil, languages = nil, &block)
      languages = languages || I18n.available_locales
      return block.call if languages.count <= 1
      inputs = prepare_inputs(languages, block, attribute)
      render 'multilang_field/wrapper',
             title: title(attribute, label),
             inputs: inputs
    end

    private

    # @return [String]
    def prepare_inputs(languages, block, attribute)
      result = []
      languages.each do |lang|
        result << block.call("#{attribute}_#{lang}", build_label(lang))
      end
      result
    end

    def title(attribute, label)
      return label if label.present?
      attribute.to_s.capitalize
    end

    def build_label(lang)
      lang_list = MultilangField.language_list&.call || {}
      lang_list[lang] ? image_tag(lang_list[lang]) : lang.to_s.capitalize
    end
  end
end
