class <%= class_name %> < Blockpile
  def initialize(helper)
    super helper
    @template     = '<%= file_name  %>'
  end
  
  
end