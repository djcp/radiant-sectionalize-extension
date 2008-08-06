namespace :radiant do
  namespace :extensions do
    namespace :custom_tags do
      
      desc "Runs the migration of the Custom Tags extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          CustomTagsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          CustomTagsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Custom Tags to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[CustomTagsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(CustomTagsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
