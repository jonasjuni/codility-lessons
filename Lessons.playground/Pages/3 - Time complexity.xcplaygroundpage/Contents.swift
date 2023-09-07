//: [Previous](@previous)

import Foundation


//O(n)
func dominant (n: Int) -> Int{
    var result = 0
    for _ in 0..<n {
        result += 1
    }
    return result
}

dominant(n: 5)


func constant(n: Int) -> Int {
    var result = n * n
    return result
}

func logarithmic(N: Int) -> Int {
    var n = N
    var result = 0
    while n > 1 {
        n /= 2
        result += 1
    }
    return result
}

logarithmic(N: 100)

//linear time

func linear(n: Int, A: [Int]) -> Int{
    for i in 0..<n {
        if A[i] == 0 {
            return 0
        }
    }
    return 1
}

func quadrantic(n: Int) -> Int{
    var result = 0
    for i in 0..<n {
        for _ in i..<n {
            result += 1
        }
    }
    return result
}

quadrantic(n: 5)

func linear2(n: Int, m: Int) -> Int {
    var result = 0
    for i in 0..<n {
        result += i
    }
    for j in 0..<m {
        result += j
    }
    
    return result
}

linear2(n: 3, m: 3)

/*:
 Problem: You are given an integer n. Count the total of 1+2+...+n.
 Solution: The task can be solved in several ways. Some person, who knows nothing about
 time complexity, may implement an algorithm in which the result is incremented by 1:
 */


func countIntSlow(n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for _ in 0...i {
            result += 1
        }
    }
    return result
}

func countInt(n: Int) -> Int {
    var result = 0
    for i in 1...n {
        result += i
    }
    
    return result
}

func countIntInstant(n: Int) -> Int {
    var result = n * (n + 1) / 2
    return result
}

countIntSlow(n: 5)
countInt(n: 5)
countIntInstant(n: 5)


public func frogJmp(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    // Implement your solution here
    var result = Double(Y - X) / Double(D)
    
    return Int(ceil(result))
}

frogJmp(10, 85, 30) // 3

//: PermMissingElem

public func permMissingElem(_ A : inout [Int]) -> Int {
    // Implement your solution here
    let n = A.count + 1
    var sum = 0
    for element in A {
        sum += element
    }
    return (n * (n + 1) / 2) - sum
}

//: TapeEquilibrium

public func tapeEquilibrium(_ A : inout [Int]) -> Int {
    // Implement your solution here
    let n = A.count
    
    var prefixSum = [Int](repeating: 0, count: n + 1)
    for i in 1...n {
        prefixSum[i] = prefixSum[i - 1] + A[i - 1]
    }

    var result = Int.max
    for P in 1..<n {
        let diff = abs(prefixSum[P] - (prefixSum[n] - prefixSum[P]))
        if diff < result {result = diff}
    }
    
    return result
}

var tapeEquilibriumArray = [3, 1, 2, 4, 3]
tapeEquilibrium(&tapeEquilibriumArray) // 1


//: [Next](@next)
