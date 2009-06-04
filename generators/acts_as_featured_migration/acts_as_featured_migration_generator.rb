class ActsAsFeaturedMigrationGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'create_features.rb', 'db/migrate', :migration_file_name => "create_features"
    end
  end
end
