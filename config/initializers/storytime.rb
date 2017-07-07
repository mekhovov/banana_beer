Storytime.configure do |config|
  # Name of the model you're using for Storytime users.
  # config.user_class = 'User'

  # Path of Storytime's dashboard, relative to
  # Storytime's mount point within the host app.
  # config.dashboard_namespace_path = '/storytime'

  # Path used to sign users in. 
  # config.login_path = '/users/sign_in'

  # Path used to sign users out. 
  # config.logout_path = '/users/sign_out'  

  # Path used to register a new user. 
  # config.registration_path = "/users/sign_up"

  # Method used for Storytime user logout path.
  # config.logout_method = :delete

  # Add custom post types to use within Storytime.
  # Make sure that the custom post types inherit the
  # from the Storytime::Post class.
  config.post_types += ["MyPost"]

  # Character limit for Storytime::Post.title <= 255
  # config.post_title_character_limit = 100

  # Character limit for Storytime::Post.excerpt
  config.post_excerpt_character_limit = 65000

  # Hook for handling post content sanitization.
  # Accepts either a Lambda or Proc which can be used to
  # handle how post content is sanitized (i.e. which tags,
  # HTML attributes to allow/disallow.
  # config.post_sanitizer = Proc.new do |draft_content|
  #   if Rails::VERSION::MINOR <= 1
  #     white_list_sanitizer = HTML::WhiteListSanitizer.new
  #     tags = white_list_sanitizer.allowed_tags
  #     attributes = white_list_sanitizer.allowed_attributes
  #   else
  #     white_list_sanitizer = Rails::Html::WhiteListSanitizer.new
  #     tags = Loofah::HTML5::WhiteList::ALLOWED_ELEMENTS_WITH_LIBXML2
  #     attributes = Loofah::HTML5::WhiteList::ALLOWED_ATTRIBUTES
  #   end
  #
  #   # Add any additional tags or attributes to tags/attributes Sets here.
  #   # tags.add("someCustomTag")
  #   # attributes.add("someCustomAttribute")
  #
  #   white_list_sanitizer.sanitize(draft_content, tags: tags, attributes: attributes)
  # # end

  # more info: https://github.com/CultivateLabs/storytime/wiki/Sanitizing-HTML-Content
  config.post_sanitizer = Proc.new do |draft_content|
    if Rails::VERSION::MINOR <= 1
      white_list_sanitizer = HTML::WhiteListSanitizer.new
      tags = white_list_sanitizer.allowed_tags
      attributes = white_list_sanitizer.allowed_attributes
    else
      white_list_sanitizer = Rails::Html::WhiteListSanitizer.new
      tags = Loofah::HTML5::WhiteList::ALLOWED_ELEMENTS_WITH_LIBXML2
      attributes = Loofah::HTML5::WhiteList::ALLOWED_ATTRIBUTES
    end

    # Add any additional tags or attributes to tags/attributes Sets here.
    tags.add("iframe")
    attributes.merge(["frameborder", "allowfullscreen"])

    white_list_sanitizer.sanitize(draft_content, tags: tags, attributes: attributes)
  end

  # Enable Disqus comments using your forum's shortname,
  # the unique identifier for your website as registered on Disqus.
  # config.disqus_forum_shortname = ''

  # Enable Discourse comments using your discourse server,
  # Your discourse server must be configured for embedded comments.
  # e.g. config.discourse_name = "http://forum.example.com"
  # NOTE:  include the '/' suffix at the end of the url
  # config.discourse_name = ''

  # Email regex used to validate email format validity for subscriptions.
  # config.email_regexp = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  # Search adapter to use for searching through Storytime Posts or
  # Post subclasses. Options for the search adapter include:
  # Storytime::PostgresSearchAdapter, Storytime::MysqlSearchAdapter,
  # Storytime::MysqlFulltextSearchAdapter, Storytime::Sqlite3SearchAdapter
  config.search_adapter = Storytime::PostgresSearchAdapter

  # Hook for handling notification delivery when publishing content.
  # Accepts either a Lambda or Proc which can be set up to schedule
  # an ActiveJob (Rails 4.2+), for example:
  # 
  # config.on_publish_with_notifications = Proc.new do |post|
  #   wait_until = post.published_at + 1.minute
  #   StorytimePostNotificationJob.set(wait_until: wait_until).perform_later(post.id)
  # end
  # 
  ### In app/jobs/storytime_post_notification_job.rb:
  # class StorytimePostNotificationJob < ActiveJob::Base
  #   queue_as :mailers
  # 
  #   def perform(post_id)
  #     Storytime::PostNotifier.send_notifications_for(post_id)
  #   end
  # end
  config.on_publish_with_notifications = nil

  # File upload options.
  config.enable_file_upload = true

  # AWS Region to use for file uploads.
  config.aws_region = ENV['STORYTIME_AWS_REGION']

  # AWS Access Key ID to use for file uploads.
  config.aws_access_key_id = ENV['STORYTIME_AWS_ACCESS_KEY_ID']

  # AWS Secret Key to use for file uploads.
  config.aws_secret_key = ENV['STORYTIME_AWS_SECRET_KEY']

  # Superclass for Storytime::ApplicationController
  # Defaults to the host app's ApplicationController
  # config.application_controller_superclass = "::ApplicationController"

  # if Rails.env.production?
  #   config.media_storage = :s3
  #   config.s3_bucket = 'mekhovov-test'
  # else
  #   config.media_storage = :file
  # end

  config.media_storage = :s3
  config.s3_bucket = ENV['STORYTIME_AWS_S3_BUCKET']
end
