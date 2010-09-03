class Blockpile::Base
  
  def initialize(helper, *args, &block)
    @helper = helper
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
    @rendered_template ||= render(:partial => @template, :locals => {:pile => self, :p => self})
  end
  
  def method_missing(*args, &block)
    @helper.send(*args, &block)
  end
  
end
