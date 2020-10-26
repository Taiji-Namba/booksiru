Rails.application.config.generators do |g|
  g.assets false
  g.helper false
  g.skip_routes true
  g.test_framework :rspec,
                    fixtures: true,
                    view_specs: false,
                    routing_specs: false,
                    helper_specs: false,
                    controller_spec: false,
                    request_specs: true
end
