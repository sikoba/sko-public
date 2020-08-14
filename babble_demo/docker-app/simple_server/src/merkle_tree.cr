
require "openssl"

#module Sikoba::Cryptography


def self.sha256(msg : String) : String
    hash = OpenSSL::Digest.new("SHA256")
    hash.update(msg)
    return hash.hexdigest
end

# Generate the merkle root from the prived records.
# hashes are treated as (hex) strings instead of binary
# the leafs should be hashed
def self.merkle_root(layer : Array) : String
    i = 0;
    layerup = Array(String).new();
    while (i < layer.size-1)
        layerup.push(sha256(layer[i]+layer[i+1]));
        i += 2;
    end
    if (i == layer.size-1)
        layerup.push(sha256(layer[i]));
    end
    if (layerup.size() == 1)
        return layerup[0];
    end
    return merkle_root(layerup);
end


def self.hash_leaves(records : Array) : Array
    result = Array(String).new
    records.each do |data|
        result.push(sha256(data))
    end
    return result
end

# Generate a merkle proof.
# layer should be the leafs, idx the index of the leaf we want the proof, and path is empty
# it returns the merkel proof, starting with the leaf
def self.merkle_proof(layer : Array, idx : Int32, path : Array(String)) : Array(String)
    i = 0;
    idx_up = -1;
    layerup = Array(String).new();
    if (path.empty?)
        path.push(layer[idx])
    end
    while (i < layer.size-1)
        h = sha256(layer[i]+layer[i+1])
        layerup.push(h);
        if (i == idx)
            path.push(layer[i+1])
            idx_up = layerup.size() - 1;
        elsif (i+1 == idx)
            path.push(layer[i])
            idx_up = layerup.size() - 1;
        end
        i += 2;
    end
    if (i == layer.size-1)
        h = sha256(layer[i])
        layerup.push(h);
        if (i == idx)
            path.push("");  # no sibling
            idx_up = layerup.size() - 1;
        end
    end
    if (layerup.size() == 1)
        return path;
    end
    return merkle_proof(layerup, idx_up, path);
end

# The proof should start with the leaf
def self.check_merkle_proof(path : Array(String), root : String, idx : Int32) : Bool
    if path.empty?
        return false;
    end
    last = path[0];
    i=1;
    while i< path.size()
        if  (path[i] == "")
            last = sha256(last)
        else
            if (idx % 2 == 0)
                last = sha256(last+path[i])  
            else
                last =  sha256(path[i]+last)
            end
        end
        idx = idx // 2
        i += 1
    end
    if (last != root)
        return false;
    end
    return true;
end
