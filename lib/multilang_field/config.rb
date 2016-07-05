module MultilangField
  module Config

    mattr_accessor :language_list

    def configure
      yield self
    end
  end
end