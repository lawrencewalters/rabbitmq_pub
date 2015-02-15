require "bunny"

CHANNEL_NAME = "bunny.examples.hello_world"

conn = Bunny.new
conn.start
ch = conn.create_channel
q  = ch.queue(CHANNEL_NAME, :auto_delete => true)
x  = ch.default_exchange


x.publish("Hello!", :routing_key => q.name)
sleep 1.0

conn.close
