require "socket"
require "base64"

def first
    types = ["SendConnection", "CreateCreditLine", "MakePayment"]
    senders = ["Alice", "Bob", "Charlie"]
    targets = ["Oscar", "Romeo", "Sierra"]
    public_key = 
    "BHelfyIcJfiVU84vHphkCRQcTtQZo7XU5RTsMTb9YtzK2HuzU5aRAKjOJ3YFXEKvOEpL    
    egPaiDLMY8MbINBSO7E="
    signature = "QCmv8W5gNhxOBrCq0na05u42qthwezAjEm6Q/
    QGD1YxFJaZ36Vv0wEEsrlYK/    483tVQ0IeXqBM87VqYolnoifg=="

    selectedType = types[Random.rand(types.size)]
    selectedSender = senders[Random.rand(senders.size)]
    selectedTarget = targets[Random.rand(targets.size)]
end

def second
    text = "try"
    Base64.strict_encode(text)
    string = "172.77.5." + Random.rand(1..4).to_s
    client = TCPServer.new(string, 1338)
    client << "{\"method\":\"Babble.SubmitTx\",\"params\":[\"%s\"],\"id\":$i}    " 
    response = client.gets
    client.close
end

second
