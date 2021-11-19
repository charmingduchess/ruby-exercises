#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

def substrings (word,dictionary)
    #split word into array of words
    matches = Hash.new()
    dictionary.each do |dict_str|
        dict_str= dict_str.downcase
        word.split(" ").each do |split_str|
            split_str=split_str.downcase
            if split_str.include?(dict_str)
            matches[dict_str] = matches[dict_str] ? matches[dict_str] + 1 : 1
            end
        end
    end
    p matches
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)