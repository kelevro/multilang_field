class Article < ActiveRecord::Base
  translates :title, :description
  globalize_accessors
end
