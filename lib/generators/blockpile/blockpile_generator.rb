class BlockpileGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory 'app/blockpiles'
      m.template  'blockpile.rb', "app/blockpiles/#{file_name}.rb"
      m.directory 'app/views/blockpiles'
      m.template  'blockpile.html.erb', "app/views/blockpiles/#{file_name}.html.erb"  
    end
  end
end
