require 'multilang_field/engine'

module MultilangField
  autoload :HelperMacro, 'multilang_field/helper_macro'
  # autoload :ErrorsMacro, 'multilang_field/errors_macro'
end

ActionView::Base.include(MultilangField::HelperMacro)
# ActiveModel::Errors.include(MultilangField::ErrorsMacro)
