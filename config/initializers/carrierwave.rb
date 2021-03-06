if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: "ap-northeast-1"
    }
    config.fog_directory = "square-s3"
    config.asset_host = "https://static.libooksquare.com"
  end
end