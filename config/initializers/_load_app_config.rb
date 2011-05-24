# Sets up AppConfig. Unless stated below, each entry is a the string in
# the file app_config.yml, as applicable for current environment.

require File.join(Rails.root, 'lib', 'app_config')

AppConfig.configure_for_environment(Rails.env)