# Include hook code here
require 'blockpile'

Dir.glob(Rails.root.to_s + '/app/blockpiles/*') {|file| require file}
