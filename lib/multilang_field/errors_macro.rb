module MultilangField
  module ErrorsMacro
    def add(attribute, message = :invalid, options = {})
      return super unless self.translated?(attribute)
      super build_multilang_attr_name(attribute), message, options
    end

    def build_multilang_attr_name(attribute)
      "#{attribute}_#{I18n.available_lovales.first}"
    end
  end
end
