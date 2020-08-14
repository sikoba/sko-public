require "./spec_helper.cr"
require "../src/merkle_tree.cr"

describe "MerkleTree class" do
  describe "Verify merkle proofs" do
    records= ["hello","test","me","again","please"];

    leaves = hash_leaves(records)
    r = merkle_root(leaves)
    (0..leaves.size()-1).each do |i|
        p = [] of String;
        p = merkle_proof(leaves, i, p);
        check_merkle_proof(p,r,i).should eq true
    end
  end
   
end
