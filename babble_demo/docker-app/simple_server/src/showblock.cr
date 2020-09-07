def showblock(number : Int32)
    z = Static.try 0
    str = "data" + z.to_s + ".json"
    if File.exists?(str)
        file = File.open(str, mode = "r")
        content = file.gets_to_end
        stk = content.split("\n")
        i = 0
        while stk[i]?
            if stk[i].starts_with?("Block")
                tmp = stk[i].split(" ")
                j = 0
                while tmp[j]?
                    if tmp[j] == number.to_s
                        puts stk[i + 1]
                    end
                    j+=1
                end
            else
                z = Static.try 1
                showblock(number)
            end
            i+=1
        end
    end
end



class Static
    @@name = 0
    def self.try(value)
        @@name += value
        return @@name
    end
end