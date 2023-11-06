//: [Previous](@previous)

import Foundation
/*:
 Problem: Given array A consisting of N integers, return the reversed array.
 */

func invertArray(_ array: [Int]) -> [Int] {
    
    var reversed: [Int] = array
    let n = array.count
    
    // Only half of aray count
    for i in 0..<n / 2 {
        var k = n - 1 - i
        (reversed[i], reversed[k]) = (reversed[k], reversed[i])
        //        var temp = reversed[i]
        //        reversed[i] = reversed[k]
        //        reversed[k] = temp
    }
    return reversed;
}
invertArray([0, 1, 2, 3, 4, 5])

public func solution1a(_ A : inout [Int], _ K : Int) -> [Int] {
    
    // Implement your solution here
    var n = A.count
    if K == n || n == 0 {return A}
    for _ in 0..<K {
        for j in 0..<n - 1 {
            (A[0], A[j + 1]) = (A[j + 1], A[0])
        }
    }
    return A
}

//var array: [Int] = [0,1,2,3]
//solution(&array, 1) // [2, 3, 0, 1]


public func solution1b(_ A : inout [Int], _ K : Int) -> [Int] {
    // Implement your solution here
    let n = A.count
    if K == n || n < 1 || K < 1 {return A}
    let index = n - (K % n)
    let slice1 = A[..<index]
    let slice2 = A[index...]
    A = Array(slice2) + Array(slice1)
    return A
}

//var array2: [Int] = [0,1,2,3]
//solution2(&array2, 6) // [2, 3, 0, 1]

//: OddOccurrencesInArray

public func solution2a(_ A : inout [Int]) -> Int {
    // Implement your solution here
    var n = A.count
    for i in 0..<n {
        var count = 0
        for j in 0..<n
        {
            if A[i] == A[j] {
                count += 1
            }
        }
        if count % 2 == 1{
            return A[i]
        }
    }
    return A[0]
}

var array2a = [9, 3, 9, 3, 9, 7, 9]
solution2a(&array2a)

public func solution2b(_ A : inout [Int]) -> Int {
    // Implement your solution here
    var result = 0
    for element in A {
        result ^= element
    }
    
    return result
}

var array2b = [9, 3, 9, 3, 9, 7, 9]
solution2b(&array2b)

//: [Next](@next)
