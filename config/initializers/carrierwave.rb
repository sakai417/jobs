CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Settings.jobs[:aws_access_key_id],
    aws_secret_access_key: Settings.jobs[:aws_secret_access_key],
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