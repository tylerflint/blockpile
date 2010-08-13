require 'rails'
require 'blockpile/setup'
require 'blockpile/base'
require 'blockpile/paths'

module Blockpile
  class Railtie < Rails::Railtie
    initializer "blockpile.setup default directories" do
      Blockpile.setup do |config|
        config.add_load_path Rails.root.to_s + '/app/helpers/blockpiles'
      end
      Blockpile::Paths.add_template_path Rails.root.to_s + '/app/views/blockpiles/'
    end
  end
  
  def self.setup
    yield Blockpile::Setup
  end
  
end