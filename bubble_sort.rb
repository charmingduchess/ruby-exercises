def bubble_sort(array)
    (0...array.size-1).each do |i|
        (0...array.size-i-1).each do |j|
            if array[j]>array[j+1]
                temp = array[j]
                array[j]=array[j+1]
                array[j+1]=temp
            end
        end
        
    end
    p array
end

bubble_sort([2,3,1,7,9,20,0])