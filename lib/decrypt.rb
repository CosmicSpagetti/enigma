require './lib/enigma'
require './lib/shifts'
require './lib/key'
require './lib/offset'

encrypted, create, key, date = ARGV

encrypted_message = File.open(encrypted, "r")
created = File.open(create, "w")

encrypted_message = Enigma.new.decrypt(encrypted_message.read, key, date)
created.write(encrypted_message[:encryption])
created.close


p "Created #{create} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
