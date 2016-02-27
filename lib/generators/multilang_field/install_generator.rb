module MultilangField
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Copy MultilangField default files'
      source_root File.expand_path('../templates', __FILE__)

      def view_template
        template 'app/views/multilang_field/_wrapper.html.slim'
      end
    end
  end
end