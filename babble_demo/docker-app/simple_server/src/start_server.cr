require "./app"
require "socket"
require "base64"

host = ENV.fetch("BABBLE_HOST")
port = ENV.fetch("BABBLE_PORT").to_i

puts "Opening socket for Babble at #{host}:#{port}..."
server = TCPServer.new(host, port)
block_handler = BlockHandler.instance

z = 1

loop do
  server.accept do |client|
    message = client.gets # raw block data
    pp! message
    # TODO process received message from Babble below
    begin
      json = JSON.parse(message.as(String))  
      transactions = Array(String).from_json(json["params"][0]["Body"]["Transactions"].to_s)
      puts "START\n\n\n\n\n\n\n\n"
      ####MY PART
      puts "first trans", transactions[0]
      if File.exists?("test.txt")
      else File.open("test.txt", mode = "w")
      end
      i = 0
      while transactions[i]?
        puts "number : " + i.to_s
        puts "transactions:" + transactions[i]
        File.write("test.txt", transactions.to_s, mode:"a")
        i+=1
      end
  
    ####END OF MY PART
        puts "END\n\n\n\n\n\n\n\n\n"
  
  
  
      # parsing each transaction
      transactions.each do |tx_base64|
        # decode from base64
        tx_string = Base64.decode_string(tx_base64)
  
        # TODO figure out which data is important and should be processed here
  
        pp! tx_string
      end
  
      # Finally, write the block data.
      puts "\n\n\nNEW BLOCK HERE"
      puts "blocknumber:" + z.to_s  
      block_data = transactions.to_s # TODO determine block data
      block_handler.write_block(block_data)
      block_handler.read_file
      puts "block data : "
      puts block_handler
      z +=1
    rescue exception
      client.send("OK")
    end

    


   
  end
end

puts "Socket opened and listening."
