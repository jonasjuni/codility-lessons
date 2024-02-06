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

//let test = [6, 5, 3, 1, 8, 7, 2, 4]
//mergeSort([7, 6, 5, 1, 3, 2])

/// Exercises

func distinct(A: [Int]) -> Int{
    let n = A.count
    if n < 1 {
        return 0
    }
    var sorted = A.sorted()
    var result = 1
    for i in 0..<n - 1 {
        print("\(sorted[i]), \(sorted[i + 1])")
        if sorted[i] != sorted[i + 1] {
            result += 1
        }
    }
    return result
}

//distinct(A: [1, 2, 3, 4]) //4
func maxProductOfThree( A: inout [Int]) -> Int {
    let n = A.count
    A.sort()
    var result = A[0] * A[1] * A[n - 1] //Two biggest negatives and biggest natural
    result = max(result, A[n - 3] * A[n - 2] * A[n - 1]) // biggest triplet
    
    return result
}

//var a = [-5, 5, -5, 4]
//maxProductOfThree(A: &a)

func triangle(A: inout [Int]) -> Int {
    let n = A.count
    if n < 3 {
        return 0
    }
    
    A.sort()
    for i in 0..<n - 2 {
        if A[i] + A[i + 1] > A[i + 2] {
            return 1
        }
    }
    return 0
}

//var a = [10, 2, 5, 1, 8, 20]
//triangle(A: &a)
//Brute force, naive solution
func numberOfDiscIntersections( A: inout [Int]) -> Int {
    let n = A.count
    var result = 0
    
    var leftSidePoints: [Int] = []
    var rightSidePoints: [Int] = []
    
    for i in stride(from: 0, to: n - 1, by: 1) {
        let r = A[i]
        let iLeft = i - r
        let iRight = i + r
        
        leftSidePoints.append(iLeft)
        rightSidePoints.append(iRight)
        
        for j in i + 1..<n {
            let r = A[j]
            let jLeft = j - r
            let jRight = j + r
            
            print("D\(i): \(iRight) -> D\(j): \(jLeft)")
            if iRight >= jLeft {
                result += 1
                if result > 10_000_000 {
                    return -1
                }
            }
        }
    }
    return result
}

var a = [1, 5, 2, 1, 4, 0]

// Solution O(N*log(N)) https://stackoverflow.com/a/14042683/9140253
func numberOfDiscIntersections2(A: [Int]) -> Int {
    let n = A.count
    enum CircleEdge {
        case left, right
    }
    
    var axis:[(Int, CircleEdge)] = []
    
    for i in 0..<n {
        let radius = A[i]
        axis.append((i - radius, .left))
        axis.append((i + radius, .right))
    }
    
    axis.sort {
        if $0.0 != $1.0 {
            return $0.0 < $1.0
        } else {
            return $0.1 == .left
        }
    }
    
    var total = 0
    var overlapTotal = 0
    
    for (num, edge) in axis {
        print("\(num) - \(edge)")
        if edge == .left {
            overlapTotal += total
            if overlapTotal > 10_000_000 {
                return -1
            }
            total += 1
        } else {
            total -= 1
        }
    }
    return overlapTotal
}
numberOfDiscIntersections2(A: a)


//: [Next](@next)
