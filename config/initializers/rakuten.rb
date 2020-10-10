require "rakuten_web_service"
require "dotenv"

RakutenWebService.configure do |c|
  c.application_id = Rails.application.credentials[:application_id]
  c.affiliate_id = Rails.application.credentials[:affiliate_id]
end