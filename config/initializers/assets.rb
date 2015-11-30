# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

# semantic-ui
Rails.application.config.assets.precompile += %w(
  semantic-ui/dist/semantic.js
  semantic-ui/dist/semantic.css
)

# layout
Rails.application.config.assets.precompile += %w(
  applicant.js applicant.css
  enterprise.js enterprise.css
  admin.js admin.css
)
