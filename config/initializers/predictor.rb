require "predictor"
require "redis"

# configure redis
Predictor.redis = Redis.new(:url => ENV['REDISTOGO_URL'])
