module BlogEngine
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      
      def copy_assets
        # Layout
        copy_file"app/views/layouts/blog_engine.html.erb","app/views/layouts/blog_engine.html.erb"
      end
    end
  end
end