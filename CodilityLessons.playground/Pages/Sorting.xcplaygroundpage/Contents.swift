//: [Previous](@previous)

import Foundation

///Chapter 6 Sorting

var array = [5, 2, 8, 14, 1, 16]

//Selection sorting
func selectionSort(_ A: [Int]) -> [Int]{
    let n = A.count
    var result = A
    
    for i in 0..<n - 1 {
        var smallest = i
        for j in i + 1..<n {
            if result[j] < result[smallest] {
                smallest = j
            }
        }
        result.swapAt(i, smallest)
    }
    return result
}
//selectionSort(array)

//Counting sort
func countingSort(_ A: [Int], _ k: Int) -> [Int] {
    var counter = Array(repeating: 0, count: k + 1)
    
    for element in A {
        counter[element] += 1
    }
    
    var result: [Int] = []
    for i in 0..<k + 1 {
        for _ in 0..<counter[i] {
            result.append(i)
        }
    }
    return result
}
//countingSort(array, 16)

//Merge sort
func mergeSort(_ A:[Int]) -> [Int] {
    let n = A.count
    var array = A
    splitPart(iStart: 0, iEnd: n - 1)
    
    func splitPart(iStart: Int, iEnd: Int) {
        
        if iStart >= iEnd {
            return
        }
        
        let iMiddle = iStart + (iEnd - iStart) / 2
        
        splitPart(iStart: iStart, iEnd: iMiddle)
        splitPart(iStart: iMiddle + 1, iEnd: iEnd)
        merge(iStart: iStart, iMiddle: iMiddle, iEnd: iEnd)
    }
    
    func merge(iStart: Int, iMiddle: Int, iEnd: Int) {
        
        var i = iStart // new array index
        var lIndex = iStart // left side first index
        var rIndex = iMiddle + 1 // right side first index
        var tempIndex = false //
        var l = iStart // left side count
        
        print("Range: (\(iStart), \(iMiddle), \(iEnd)) - \(array[iStart...iMiddle]) - \(array[iMiddle + 1...iEnd])")
        
        while l <= iMiddle && rIndex <= iEnd {
            print("\(i): {l:\(lIndex), r:\(rIndex)} --- \(array[lIndex]) > \(array[rIndex]) \(tempIndex ? "*" : "")")
            if i == lIndex {
                tempIndex = false
            }
            
            if array[lIndex] > array[rIndex] {
                array.swapAt(i, rIndex)
                if !tempIndex {
                    lIndex = rIndex
                }
                if iEnd - iMiddle < 2 {
                    
                } else {
                    rIndex += 1
                }
                
                tempIndex = true
                
            } else {
                l += 1
                array.swapAt(i, lIndex)
                if !tempIndex {
                    lIndex += 1
                }
            }
            i += 1
            
            print(array)
        }
        print(array[iStart...iEnd])
    }
    return array
}

let test = [6, 5, 3, 1, 8, 7, 2, 4]
//mergeSort([7, 6, 5, 1, 3, 2])


//: [Next](@next)
