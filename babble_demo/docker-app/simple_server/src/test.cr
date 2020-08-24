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
        File.write("data.json", "Nombre de block : " + nb.to_s + "\n\n", mode:"a")
        w = 0
        str_sha = "0"
        while try[i]?
            if try[i].starts_with?("blocknumber")
                nb+=1
                stk_block = try[i]
                get_block = stk_block[12..-17]
                string_sha256 = ""
                str_block_number = "Block numero : " + get_block.to_s + "\n"
                str_nb_tr = "nombre de transactions dans ce block: " + tr.to_s + "\n"
                str_size_tr = "Taille transactions du block numéro " + get_block.to_s + " : " + size_block.to_s + "\n"
                File.write("data.json", "\nhash : " + str_sha + "\n",mode:"a")
                File.write("data.json", str_block_number, mode:"a")
                File.write("data.json", str_nb_tr, mode:"a")
                File.write("data.json", str_size_tr, mode:"a")
                r = ""
                tmp_hash = hash_leaves(array)
                r = merkle_root(tmp_hash)
                str_merkle_root = "tx merkle root : " + r.to_s 
                File.write("data.json", str_merkle_root, mode:"a")
                str_tr = ""
                while array[w]?
                    str_tr += array[w].to_s + "\n"
                    File.write("data.json", array[w].to_s + "\n", mode:"a")
                    w+=1
                end
                string_sha256 = str_block_number + str_nb_tr + str_size_tr + str_merkle_root + str_tr
                str_sha = sha256(string_sha256)
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

def check_hashes(file_name)
    file = File.open(file_name, mode = "r")
    content = file.gets_to_end
    stk = content.split("\n")
    i = 0
    str = ""
    array = Array(String).new
    stk_hash = Array(String).new
    while stk[i]?
        if stk[i].starts_with?("hash")
            tmp_hash = stk[i].split(" ")
            stk_hash << tmp_hash[2]
            stk.delete_at(i)
        end
        str += stk[i] + "\n"
        i+=1
    end
    stk_hash.delete_at(0)
    tmp = str.split("\n\n")
    tmp.delete_at(-1)
    tmp[1] = tmp[1][1..]
    i = 1
    j = 1
    stk_sha = Array(String).new
    while tmp[i]?
        tmp[i]+="\n"
        #puts "block " + j.to_s + " " + sha256(tmp[i])
        stk_sha << sha256(tmp[i])
        i+=1
        j+=1
    end
    stk_sha.delete_at(-1)
    comparing_array_of_hashes(stk_hash, stk_sha)
end

def comparing_array_of_hashes(hashes_from_files : Array, hashes_calculated : Array)
    i = 0
    while hashes_from_files[i]?
        if hashes_from_files[i] == hashes_calculated[i]
            i+=1
        else
            puts "fichier non valide"
            exit
        end
    end
    puts "OK"
end

#file
check_hashes("data.json")
