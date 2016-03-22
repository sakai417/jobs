CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'hjkfjdslkjf',
    aws_secret_access_key: 'fjdajfadslkfjdasjfadsd',
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'jobs-image'
        config.asset_host = 'https://s3.amazonaws.com/jobs-image'
    when 'production'
        config.fog_directory  = 'jobs-image'
        config.asset_host = 'https://s3.amazonaws.com/jobs-image'
    end
end