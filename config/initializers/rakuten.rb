require "rakuten_web_service"
require "dotenv"

RakutenWebService.configure do |c|
  c.application_id = APPLICATION_ID
  c.affiliate_id = AFFILIATE_ID
end