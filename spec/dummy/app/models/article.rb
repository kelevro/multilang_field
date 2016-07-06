class Article < ActiveRecord::Base
  translates :title, :description
  accepts_nested_attributes_for :translations

  class Translation
    validates :description, presence: true
  end

  after_initialize :build_translations, if: Proc.new { |obj| obj.new_record? }

  private

  def build_translations
    I18n.available_locales.each do |locale|
      translation_for(locale)
    end
  end
end
