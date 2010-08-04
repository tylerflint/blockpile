# include our custom helper paths in ActionView
helper_path     = File.join(File.dirname(__FILE__), 'lib', 'app', 'helpers') 
blockpile_path  = File.join(Rails.root.to_s, 'app', 'helpers', 'blockpiles')
ActiveSupport::Dependencies.autoload_paths << helper_path << blockpile_path

# include the blockpiles helper
ActionView::Base.send :include, BlockpilesHelper