require "./app"
require "socket"
require "base64"

host = ENV.fetch("BABBLE_HOST")
port = ENV.fetch("BABBLE_PORT").to_i

puts "Opening socket for Babble at #{host}:#{port}..."
server = TCPServer.new(host, port)
block_handler = BlockHandler.instance

loop do
  server.accept do |client|
    message = client.gets # raw block data
    pp! message

    # TODO process received message from Babble below
    json = JSON.parse(message.as(String))

    transactions = Array(String).from_json(json["params"][0]["Body"]["Transactions"].to_s)

    # parsing each transaction
    transactions.each do |tx_base64|
      # decode from base64
      tx_string = Base64.decode_string(tx_base64)

      # TODO figure out which data is important and should be processed here

      pp! tx_string
    end

    # Finally, write the block data.
    block_data = "placeholder" # TODO determine block data
    block_handler.write_block(block_data)
  end
end

puts "Socket opened and listening."
