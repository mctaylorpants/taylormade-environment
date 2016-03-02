# Try to load Rails environment
rails = File.join(Dir.getwd, 'config', 'environment.rb')

if File.exist?(rails)
  require rails
  env = ENV['RAILS_ENV'] || Rails.env
  puts "Loading Rails environment: #{env}"
end
