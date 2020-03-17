# frozen_string_literal: true

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAVEPV3O6S4D5CCGWQ',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory = 'almemo'
    config.cache_storage = :fog
  end
end
