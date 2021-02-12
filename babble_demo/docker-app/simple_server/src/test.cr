require "json" 
require "base64"

#créer un nouveau fichier en fonction de int nb
def defining_block_name
    nb : Int32 = 4000
    i = Static.incrementing 0
    base_name = "data" + i.to_s + ".json"
    if File.exists?(base_name)
        if (File.size("data" + i.to_s + ".json")) > nb
            base_name = "data" + i.to_s + ".json"
            i = Static.incrementing 1
        end
    end
    return str = "data" + i.to_s + ".json"
end

#Classe pour simuler un static
class Static
    @@winning_condition = 0
    def self.incrementing(value)
        @@winning_condition += value
        return @@winning_condition
    end
    @@winning = 0
    def self.increment(value)
        @@winning += value
        return @@winning
    end
    def self.try(name, value)
        name += value
        return name
    end
    def self.reset
        @@winning_condition = 0
        return @@winning_condition
    end
    @@new_val = 0
    def self.tmp(value)
        @@new_val += value
        return @@new_val
    end
end

#Class pour faire l'addition pour la taille du block
class My_Count
    @@counting = 0
    def self.add(val1, val2)
        @@counting = val1 + val2
        return @@counting
    end
    def self.show
        return @@counting
    end
end

#Classe pour stocker le dernier hash et le filer au premier calcule du fichier suivant
class Stocking
    @@stk = String.new
    def self.tmp(tmp)
        @@stk = tmp
        return @@stk
    end
    def self.show
        return @@stk
    end
end

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
        block_name = defining_block_name.not_nil!
        if (Static.incrementing 0) == 0
            File.write(block_name, "Taille totale transactions : " + size_total.    to_s + "\n", mode:"a")
            File.write(block_name, "Nombre de block : " + nb.to_s + "\n\n",     mode:"a")
        end
        w = 0
        str_sha = "0"
        string_sha256 = ""
        My_Count.add(0, 0)
        while try[i]?
            if try[i].starts_with?("blocknumber")
                block_name = defining_block_name
                nb+=1
                stk_block = try[i]
                get_block = stk_block[12..-17]
                str_block_number = "Block numero : " + get_block.to_s + "\n"
                str_nb_tr = "nombre de transactions dans ce block: " + tr.to_s + "\n"
                str_size_tr = "Taille transactions du block numéro " + get_block.to_s + " : " + size_block.to_s + "\n"
                str_tr = ""
                while array[w]?
                    str_tr += array[w].to_s + "\n"
                    w+=1
                end
                string_sha256 = ""
                File.write(block_name, "\nhash : " + str_sha + "\n",mode:"a")
                File.write(block_name, str_block_number, mode:"a")
                File.write(block_name, str_nb_tr, mode:"a")
                File.write(block_name, str_size_tr, mode:"a")
                r = ""
                tmp_hash = hash_leaves(array)
                r = merkle_root(tmp_hash)
                str_merkle_root = "tx merkle root : " + r.to_s 
                File.write(block_name, str_merkle_root, mode:"a")
                File.write(block_name, str_tr, mode:"a")
                string_sha256 = str_block_number + str_nb_tr + str_size_tr + str_merkle_root + str_tr
                str_sha = sha256(string_sha256)
                My_Count.add(str_sha.size, string_sha256.size)
                w = 0
                array = [""]
                size_block = 0
                tr = 0
            end
            if try[i].starts_with?("transactions")
                tr += 1
                stk = try[i]
                tmp = stk[13..-17]
                stking = Base64.decode_string(tmp)
                array << stking.to_json
                size = stking.to_json.size
                size_block+=size
            end

            i+=1
        end
    end
end


def check_hashes(file_name)
    file = File.open(file_name, mode = "r")
    content = file.gets_to_end
    stk = content.split("\n")
    if stk[0] == ""
        stk.delete_at(0)
    end
    try = content.split("\n\n")
    j = 0
    while try[j]?
        j+=1
    end
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
    tmp = str.split("\n\n")
    if stk_hash[0] == "0"
        stk_hash.delete_at(0)
    end
    tmp.delete_at(-1)
    i = 0
    if tmp[0].starts_with?("Taille totale")
        tmp.delete_at(0)
    end
    if tmp[0][0] == '\n'
        tmp[0] = tmp[0][1..]
    end
    if (Static.incrementing 0) == 1
        if (Static.tmp 0) == 0
            tmp[1] = tmp[1][1..]
            Static.tmp 1
            i = 1
        end
    end
    j = 1
    
    stk_sha = Array(String).new
    if Stocking.show != ""
        stk_sha << Stocking.show
    end
    while tmp[i]?
        tmp[i]+="\n"
        stk_sha << sha256(tmp[i])
        i+=1
    end
    comparing_array_of_hashes(stk_hash, stk_sha)
end

#Fonction pour comparer les hashes calculées et ceux présent dans le fichier
def comparing_array_of_hashes(hashes_from_files : Array, hashes_calculated : Array)
    tmp = Stocking.tmp hashes_calculated[-1]
    i = 0
    hashes_calculated.delete_at(-1)
    while hashes_calculated[i]?
        if hashes_calculated[i] == hashes_from_files[i]
            i+=1
        else
            puts "fichiers non valide au fichier : data" + i.to_s + ".json"
            exit
        end
    end
end

file
i = 0
while i - 1 != Static.incrementing 0
    str = "data" + i.to_s + ".json"
    check_hashes(str)
    i+=1
end
puts "ok"