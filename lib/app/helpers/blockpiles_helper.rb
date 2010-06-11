module BlockpilesHelper
  
  Dir.glob(Rails.root.to_s + '/app/blockpiles/*') do |file|
    file_name   = file.split(/\//).pop.gsub(/.rb/, '')
    class_name  = file_name.split("_").collect {|i| i.capitalize }.join
    class_eval %{
      def #{file_name}(*args, &block)
          block = #{class_name}.new(self, session, params, '#{file_name}', *args)
          yield block
          raw block.to_html
      end
    }
  end

end