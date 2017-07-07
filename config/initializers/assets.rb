# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.paths << Rails.root.join("vendor/assets")
Rails.application.config.assets.paths << Rails.root.join("lib/assets")

# Precompile all CSS/JS assets
Rails.application.config.assets.precompile = [Proc.new do |filename, path|
  (path =~ /vendor\/assets\/fonts/) ||
  (path =~ /(app|vendor|lib)\/assets/ && %w(.js .css .png .jpg .gif .ico .svg).include?(File.extname(filename)))
end]
