module Blockpile
  module Setup
    def self.add_load_path(path)
      Dir.glob(path + "/**/*.rb") do |file|
        ActiveSupport::Dependencies.autoload_paths << File.dirname(file)
        file_name   = file.split(/\//).pop.gsub(/.rb/, '')
        class_name  = file_name.classify
        ActionView::Base.class_eval %{
          def #{file_name}(*args, &block)
              block = #{class_name}.new(self, session, params, '#{file_name}', *args)
              yield block
              raw block.to_html
          end
        }
      end
    end
  end
end