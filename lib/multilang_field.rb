require 'multilang_field/engine'
require 'multilang_field/config'

module MultilangField
  autoload :HelperMacro, 'multilang_field/helper_macro'
  extend Config
end

ActionView::Base.include(MultilangField::HelperMacro)
# ActiveModel::Errors.include(MultilangField::ErrorsMacro)
