# Include hook code here
require 'blockpile'

Dir.glob(RAILS_ROOT + '/app/blockpiles/*') {|file| require file}
