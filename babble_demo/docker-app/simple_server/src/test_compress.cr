require "compress/zip"

def compressing(file_zip_name, file_name)
    File.open("./" + file_zip_name + ".zip", "w") do |file|
        Compress::Zip::Writer.open(file) do |zip|
          zip.add(file_name, File.open(file_name))
      end
    end
end

i = 0
while i - 1 != Static.incrementing 0
    str = "data" + i.to_s + ".json"
    file_zip_name = "block" + i.to_s
    compressing(file_zip_name, str)
    i+=1
end