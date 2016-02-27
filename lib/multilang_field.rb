require 'multilang_field/engine'

module MultilangField
  autoload :HelperMacro, 'multilang_field/helper_macro'
end

ActionView::Base.include(MultilangField::HelperMacro)
