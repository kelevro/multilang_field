module MultilangField
  module HelperMacro
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