class AppConfig
  cattr_accessor :config_vars

  def self.[](key)
    config_vars[key]
  end

  def self.[]=(key, value)
    config_vars[key] = value
  end

  def self.configure_for_environment(env)
    load_config_for_environment(env)    
  end

  def self.load_config_for_environment(env)
    if File.exist? "#{Rails.root}/config/app_config.yml"
      all_envs = load_config_yaml "#{Rails.root}/config/app_config.yml"
      all_envs = load_config_yaml "#{Rails.root}/config/app_config.yml.example" unless all_envs
    else
      $stderr.puts "WARNING: No config/app_config.yml found! Look at config/app_config.yml.example for help."
      all_envs = load_config_yaml "#{Rails.root}/config/app_config.yml.example"
    end

    env = env.to_s
    if all_envs[env]
      self.config_vars = all_envs['default'].merge(all_envs[env]).symbolize_keys
    else
      self.config_vars = all_envs['default'].symbolize_keys
    end
  end  

  def self.load_config_yaml filename
    YAML.load(File.read(filename))
  end
end