#!/usr/bin/env ruby
require 'socket'

# Get IP of machine running the script
def my_first_private_ipv4
  Socket.ip_address_list.detect { |intf| intf.ipv4_private? }
end
ip = my_first_private_ipv4
puts "Using IP address #{ip.ip_address}"

# Echo IP into .env file for use
# File.open('assets/.env', 'w') do |file|
#   file.write("PC_STATS_IP=#{ip.ip_address}\n")
#   file.write('PC_STATS_PORT=7188')
# end

# Setup ENV variables with IP using default PORT
ENV['PC_STATS_IP'] = ip.ip_address
ENV['PC_STATS_PORT'] = '7188'

# Install FVM and install flutter

# Flutter run on connected device
puts `flutter run -v`
