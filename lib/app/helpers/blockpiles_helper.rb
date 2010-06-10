module BlockpilesHelper
  
  def method_missing(sym, *args, &block)
    begin
      object_sym = sym.to_s.split(/\_/).collect {|item| item.capitalize}.join.to_sym
      block = Object.const_get(object_sym).send(:new, self, session, params, sym.to_s, *args) 
      yield block
      raw block.to_html
    rescue 
      # do something here
    end
  end
  
end