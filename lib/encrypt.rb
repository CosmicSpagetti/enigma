require './lib/enigma'
require './lib/shifts'
require './lib/key'
require './lib/offset'

message, where = ARGV

message = File.open(message, "r")
encrypted = File.open(where, "w")

encrypted_message = Enigma.new.encrypt(message.read)
encrypted.write(encrypted_message[:encryption])
encrypted.close


p "Created #{where} with the key  #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
