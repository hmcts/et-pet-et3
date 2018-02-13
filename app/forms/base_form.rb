class BaseForm < ActiveRecord::Base
  establish_connection :adapter => :nulldb,
    :schema  => 'config/nulldb_schema.rb'
 end
 