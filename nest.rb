require 'nest_thermostat'
require 'librato/metrics'

# Gather data from Nest
nest = NestThermostat::Nest.new(email: params['email'], password: params['temp_secret'])
data = {
  home_temp: nest.current_temperature,
  humidity: nest.humidity
}

# Push metrics to Librato
Librato::Metrics.authenticate params['email'], params['metric_secret']
Librato::Metrics.submit data

# Log data
puts data
