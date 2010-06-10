<<<<<<< HEAD
# Include hook code here
require 'blockpile'

Dir.glob(Rails.root.to_s + '/app/blockpiles/*') {|file| require file}
=======
# include our custom helper in ActionView
path = File.join(File.dirname(__FILE__), 'lib', 'app', 'helpers') 
$LOAD_PATH << path 
ActiveSupport::Dependencies.load_paths << path 
ActiveSupport::Dependencies.load_once_paths.delete(path) 
ActionView::Base.send :include, BlockpilesHelper
>>>>>>> f2130f7
