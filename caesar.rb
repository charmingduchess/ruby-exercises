#This program takes a string (string) and an integer (num) and prints the string as with the characters shifted by num letters. 

def cypher(string,num)
    nums = string.codepoints.map do |c|
        if c.between?(65,90)
            c=65+(c+num)%26
        elsif c.between?(97,122)
            c=97+(c+num)%26
        end
        c.chr
end.join()
    p nums
end

cypher("Shift that STRING!", 5)