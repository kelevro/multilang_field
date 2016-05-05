module MultilangField
  module HelperMacro
    def nested_multilang_wrapper(form, attribute, &block)
      languages = languages || I18n.available_locales
      render 'multilang_field/nested_wrapper',
              attribute: attribute,
              form: form,
              block: block,
              languages: languages
    end

    def multilang_wrapper(attribute, languages = nil, &block)
      languages = languages || I18n.available_locales
      return block.call if languages.count <= 1
      inputs = prepare_inputs(languages, block, attribute)
      render 'multilang_field/wrapper',
             attribute: attribute,
             inputs: inputs,
             languages: languages
    end

    private

    # @return [String]
    def prepare_inputs(languages, block, attribute)
      result = {}
      languages.each do |lang|
        result[lang] = block.call("#{attribute}_#{lang}")
      end
      result
    end
  end
end
