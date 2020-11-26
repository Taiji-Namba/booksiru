require "rakuten_web_service"
require "dotenv"

RakutenWebService.configure do |c|
  c.application_id = Rails.application.credentials.rakuten[:application_id]
  c.affiliate_id = Rails.application.credentials.rakuten[:affiliate_id]
end