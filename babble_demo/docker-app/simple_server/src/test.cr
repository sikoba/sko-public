require "json" 
require "base64"

def file
    if File.exists?("../../../nohup1.out")
        file = File.new("../../../nohup1.out")
        content = file.gets_to_end
        file.close
    else
        exit
    end
    i = 0
    stocking = content.split("web")
    stk = ""
    while stocking[i]?
        j = 0
        x = 0
        test = [""]
        while stocking[j]?
            test << stocking[j]
            j+=1
            x+=1
        end
        try = test.to_s.split(" ")
        i = 0
        z = 0
        j = 0
        k = 0
        nb = 0
        tr = 0
        size_total = 0
        size_block = 0
        while try[j]?
            if try[j].starts_with?("transactions")
                tmp1 = try[j]
                tmp2 = tmp1[13..-17]
                size_total += tmp2.size 
            end
            if try[j].starts_with?("blocknumber")
                nb+=1
            end
            j+=1
        end
        array = [""]
        File.write("data.json", "Taille totale transactions : " + size_total.to_s + "\n", mode:"a")
        File.write("data.json", "Nombre de block : " + nb.to_s + "\n", mode:"a")
        w = 0
        while try[i]?
            if try[i].starts_with?("blocknumber")
                nb+=1
                stk_block = try[i]
                get_block = stk_block[12..-17]
                File.write("data.json", "\nBlock numero : " + get_block.to_s + "\n", mode:"a")
                File.write("data.json", "nombre de transactions dans ce block: " + tr.to_s + "\n", mode:"a")
                File.write("data.json", "Taille transactions du block numéro " + get_block.to_s + " : " + size_block.to_s , mode:"a")
                while array[w]?
                    File.write("data.json", array[w].to_s + "\n", mode:"a")
                    w+=1
                end
                w = 0
                array = [""]
                size_block = 0
                tr = 0
            end
            if try[i].starts_with?("transactions")
                tr += 1
                stk = try[i]
                tmp = stk[13..-17]
                size = tmp.size
                size_block+=size
                stking = Base64.decode_string(tmp)
                array << stking.to_json
            end

            i+=1
        end
    end
end

file
