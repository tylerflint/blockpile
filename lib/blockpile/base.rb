class Blockpile::Base
  
  def initialize(helper, session, params, template, *args)
    @helper = helper
    @session = session
    @params = params
    @template = template
    build *args
  end
  
  def to_html
    render_template
  end
  
  def build
    # override this method to build your block
  end
  
protected
  
  # Assumes /views/helper/ as base
  def render_template
    ERB.new( File.read( get_template ) ).result binding
  end
  
  def get_template
    get_paths.each do |path|
      if File::exists?( path + "/" + @template + ".html.erb")
        return path +  "/" + @template + ".html.erb"
      end
    end
    raise "Unable to find template for this blockpile"
  end
  
  def get_paths
    Blockpile::Paths.get_paths
  end
  
  def method_missing(*args, &block)
    @helper.send(*args, &block)
  end
  
end
