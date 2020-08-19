def showblock(number : Int32)
    file = File.open("data.json", mode = "r")
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
        end
        i+=1
    end
end