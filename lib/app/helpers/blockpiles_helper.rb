module BlockpilesHelper
  
  # Dynamically create a method to turn each blockpile into a helper method
  Dir.glob(Rails.root.to_s + '/app/helpers/blockpiles/*') do |file|
    file_name   = file.split(/\//).pop.gsub(/.rb/, '')
    class_name  = file_name.classify 
    class_eval %{
      def #{file_name}(*args, &block)
          block = #{class_name}.new(self, session, params, '#{file_name}', *args)
          yield block
          raw block.to_html
      end
    }
  end

end