#!/usr/bin/env ruby
# <bitbar.title>Battery Apple Bluetooth mouse</bitbar.title>
# <bitbar.version>0.1</bitbar.version>
# <bitbar.author>Igor Cherfas</bitbar.author>
# <bitbar.author.github>igorcherfas</bitbar.author.github>
# <bitbar.desc>Battery Percent for Magic mouse</bitbar.desc>
#
#

require 'yaml'

output = YAML.load(`system_profiler SPBluetoothDataType 2> /dev/null`);

output['Bluetooth']['Devices (Paired, Configured, etc.)'].each do |device|
        puts "Mouse: "+device[1]['Battery Level'].to_s if device[1]['Minor Type'].eql?('Mouse') && device[1].has_key?('Battery Level')
end
