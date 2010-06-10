class Blockpile
  
  attr_accessor :helper, :session, :params
  
  def initialize(helper, session, params, template, *args)
    @helper = helper
    @session = session
    @params = params
    @template = template
    build *args
  end
  
  def to_html
    render_template @template
  end
  
  def build
    # override this method to build your block
  end
  
protected
  
  # Assumes /views/helper/ as base
  def render_template(template)
    @path ||= '/app/views/blockpiles/'
    ERB.new( File.read(Rails.root.to_s + @path + template + ".html.erb") ).result binding
  end
  
  def method_missing(*args, &block)
    @helper.send(*args, &block)
  end
  
end
