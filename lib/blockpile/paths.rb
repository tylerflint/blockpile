module Blockpile
  module Paths
    
    @@paths = []
    
    def self.add_template_path(path)
      @@paths << path
    end
    
    def self.get_paths
      @@paths
    end
    
  end
end