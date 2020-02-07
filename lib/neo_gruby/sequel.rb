require "neo_gruby/sequel/version"

module NeoGruby
  module Sequel
    class Error < StandardError; end

    autoload :Db, 'neo_gruby/sequel/db'

    module Plugins
      autoload :UuidPk, 'neo_gruby/sequel/plugins/uuid_pk'
    end
  end
end

NeoGruby::Sequel::Db