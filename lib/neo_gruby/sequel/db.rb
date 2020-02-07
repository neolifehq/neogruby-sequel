require 'sequel'
require 'yaml'

module NeoGruby
  module Sequel
    module Db
      class << self
        attr_reader :conn

        def start_connections
          @conn ||= {}
          config = YAML.load_file(NeoGruby.root.join('config', 'database.yml'))
          config[NeoGruby.env].keys.each do |name|
            @conn[name.to_sym] = establish_connection(config[NeoGruby.env][name])
          end
        end

        def disconnect_all
          @conn.keys.each do |name|
            @conn[name].disconnect
          end
        end

        private

        def establish_connection(config)
          ::Sequel.connect(config)
        end
      end
    end
  end
end

NeoGruby::Registry.add :after_boot do
  NeoGruby::Sequel::Db.start_connections
  NeoGruby.db ||= NeoGruby::Sequel::Db.conn
end

NeoGruby::Registry.add :after_boot do
  Dir[NeoGruby.root.join('app', 'models', '*.rb')].each do |f|
    require f
  end
end