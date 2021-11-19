#create cypher that shifts letters by number argument

#split string into array of letters
#loop thru, change to int, add num, change back to letter=>integer.chr
#join

#if its between 65-90, add to 65 and modulo that 26 and add to


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

cypher("What a string!", 5)