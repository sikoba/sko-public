require "../spec_helper.cr"

describe "BlockHandler class" do
  describe "def self.write_block(block_data)" do
    block_handler = BlockHandler.instance

    # clear existing file contents
    block_handler.delete

    # FIRST WRITE
    block_handler.write_block("data")

    # read the file contents after writing once.
    # since writing to empty file, it should only contain "data"
    block_handler.read_file.should eq "data"

    ###

    # SECOND WRITE
    block_handler.write_block("data")

    # since we are writing twice without clearing the file contents, it should contain double "data"
    block_handler.read_file.should eq "datadata"
  end
end
