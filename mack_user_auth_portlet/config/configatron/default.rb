# This is where you would override any of the default Mack configuration settings,
# as well as create your own settings. The configuration settings for your environment
# can be dumped out using this rake task:
# 
#   rake mack:dump:config#<environment>
# 
# Configuration parameters can be used in your application like such:
# 
#   configatron.<setting_name>
# 
# Nested parameters can be defined using ::.
# 
# Examples:
# default.rb: 
#   configatron.default_time_limit: <%= 15.minutes %>
#   configatron.api.timeout_limit: <%= 15.seconds %>
# 
# configatron.default_time_limit # => 900
# configatron.api.timeout_limit # => 15

configatron.mack.session_id = '_mack-user_auth_portlet_session_id'
configatron.mack.testing_framework = 'rspec'
configatron.default_secret_key = 'DGC5LHAMPFGPC3EC3Y6XPECLRJYBPNH4EDL4YNZ6YG67DSQ4XM7BP3MLD884HRR54XGP3DX3S5XT35MW'

# Mack provides RJS support through mack-javascript gem.
# In order to have RJS support, you will need to perform the following steps:
# 1.  Uncomment the code below, and make sure that the framework is the one you want to use
# 2.  run:  rake generate:javascript
# configatron.mack.js_framework = 'jquery'
