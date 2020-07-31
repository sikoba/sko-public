# Handles reading and writing data on disk.
class BlockHandler
  @@block_handler : BlockHandler?

  # file that will contain the data that is written
  @@filepath : String = "blocks.sko"

  # Primary constructor.
  # Made private to enable singleton pattern.
  private def initialize
  end

  # Singleton design pattern implementation.
  def self.instance
    @@block_handler ||= new
  end

  # Will write the provided *block_data* to the file as defined by the BlockHandler#filepath class instance.
  # It will append the data at the end of the file.
  # It will create the file if it does not already exist.
  def write_block(block_data : String)
    File.write(@@filepath, block_data, mode: "a")
  end

  # Reads the contents of the main file from disk and returns them.
  def read_file
    File.read(@@filepath)
  end

  # Deletes the main file from disk.
  def delete
    File.delete(@@filepath)
  end
end
