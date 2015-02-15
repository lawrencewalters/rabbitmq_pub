require "bunny"

CHANNEL_NAME = "bunny.test.json"

conn = Bunny.new
conn.start
ch = conn.create_channel
q  = ch.queue(CHANNEL_NAME, :auto_delete => true)
x  = ch.default_exchange

10.times do
  x.publish("{\"my_string\": \"heyo\", \"my_int\":\"1\"}", :routing_key => q.name)
end

conn.close
