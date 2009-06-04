require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/test_case'
require 'active_record'
require 'factory_girl'

require File.expand_path( File.dirname(__FILE__) + '/../init' )
require 'data/models'

class ActiveSupport::TestCase

  def reset_db!
    ::ActiveRecord::Migration.verbose = false
    ::ActiveRecord::Base.establish_connection( { :adapter => 'sqlite3', :dbfile => ':memory:' } )
    
    load File.join( File.dirname(__FILE__), 'data/schema.rb')
    load File.expand_path( File.dirname(__FILE__) + '/../generators/acts_as_featured_migration/templates/migration.rb' )
    ActsAsFeaturedMigration.migrate :up
  end
  
  Factory.define :article do |a|
    a.subject 'lorem'
    a.body 'ipsum'
  end
  
  Factory.define :post do |a|
    a.subject 'foo'
    a.body 'bar'
  end
  
end
