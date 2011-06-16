# Disable root element in JSON by default.
if defined?(ActiveRecord)
  ActiveRecord::Base.include_root_in_json = false
end