def insertionSort(arr):
 
    for i in range(1, len(arr)):
 
        key = arr[i]
 
        # Moves elements to one position ahead if greater
        j = i-1
        
        while j >= 0 and key < arr[j] :
                arr[j + 1] = arr[j]
                j -= 1
        arr[j + 1] = key
 
# Driver code to test above
arr = [8, 24, 10, 26, 6]
insertionSort(arr)
for i in range(len(arr)):
    print ("% d" % arr[i])