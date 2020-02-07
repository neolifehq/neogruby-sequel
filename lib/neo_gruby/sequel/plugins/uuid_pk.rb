require 'uuidtools'

module NeoGruby
  module Sequel
    module Plugins
      module UuidPk
        class << self
          def parse_id(value, to_raw = false)
            value = UUIDTools::UUID.parse(value) if value.is_a?(String) && value.encoding.name != 'ASCII-8BIT'
            value = UUIDTools::UUID.parse_int(value) if value.is_a? Integer
            return(value.respond_to?(:raw) ? value.raw : value) if to_raw
            value = UUIDTools::UUID.parse_raw(value) unless value.nil?
            value
          end
        end

        module ClassMethods

          def find(where)
            if where.is_a? Hash
              where[:id] = UuidPk.parse_id(where[:id], true) if where[:id]
              where['id'] = UuidPk.parse_id(where['id'], true) if where['id']
            end
        
            super(where)
          end
        
          def where(params)
            if params.is_a? Hash
              params[:id] = UuidPk.parse_id(params[:id], true) if params[:id]
              params['id'] = UuidPk.parse_id(params['id'], true) if params['id']
            end
        
            super(params)
          end
        
          def [](value)
            super(UuidPk.parse_id(value, true))
          end
        end
        
        module InstanceMethods
          def before_validation
            field = :id
            meth = :"#{field}="
            if respond_to?(field) && respond_to?(meth) && get_column_value(field).nil?
              set_column_value(meth, UUIDTools::UUID.timestamp_create.raw)
            end
          end
        
          def id
            UuidPk.parse_id(super)
          end
        end
      end
    end
  end
end