module MultilangField
  module HelperMacro
    def multilang_wrapper(form, attribute, label = nil, &block)
      build_translations(form)
      render 'multilang_field/wrapper',
              title: title(attribute, label),
              form: form,
              block: block
    end

    def build_label(lang)
      lang_list = MultilangField.language_list&.call || {}
      lang_list[lang] ? image_tag(lang_list[lang]) : lang.to_s.capitalize
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

    def build_translations(form)
      I18n.available_locales.each do |locale|
        unless exists_translation?(form, locale)
          form.object.translations.build(locale: locale)
        end
      end
    end

    def exists_translation?(form, locale)
      form.object.translations.each do |translation|
        return true if translation.locale == locale
      end
      false
    end

    def title(attribute, label)
      return label if label.present?
      attribute.to_s.capitalize
    end
  end
end
