class Blockpile
  
  def initialize(helper)
    @helper = helper
    @path   = '/app/views/blockpiles/'
  end
  
  def to_html
    render_template @template
  end
  
protected
  
  # Assumes /views/helper/ as base
  def render_template(template)
    ERB.new( File.read(RAILS_ROOT + @path + template + ".html.erb") ).result binding
  end
  
  def method_missing(*args, &block)
    @helper.send(*args, &block)
  end
  
end
