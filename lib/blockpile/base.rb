class Blockpile::Base
  
  def initialize(helper, template, *args, &block)
    @helper = helper
    @template = template
    build *args
    @content = capture(self, &block) if block_given?
  end
  
  def to_html
    render_template
  end
  
  def get_content
    @content
  end
  
  def build
    # override this method to build your block
  end
  
protected
  
  # Assumes /views/helper/ as base
  def render_template
    render( :partial => @template, :locals => {:pile => self, :p => self})
  end
  
  def get_template
    get_paths.each do |path|
      if File::exists?( path + "/" + @template + ".html.erb")
        return path +  "/" + @template
        puts path +  "/" + @template
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
