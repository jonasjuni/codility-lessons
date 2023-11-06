//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


//: waming test
public func warming(_ A : inout [Int]) -> Int {
    // Implement your solution here
    var counter = [Int](repeating: 0, count:1000001)
    
    for element in A {
        if element > 0 {
            counter[element] += 1
        }
    }
    
    for i in 1...counter.count {
        if counter[i] == 0 {
            return i
        }
    }
    
    return 1
}

public func solution(_ A : inout String, _ B : inout String) -> Int {
    // Implement your solution here
    var n = A.count
    let arrayA = Array(A)
    var arrayB = Array(B)
    
    
    var result = 0
    var startPos = 0
    while startPos <= n {
        var debug = "pos: \(startPos) "
        var sequence = 0
        for i in startPos..<n {
            for j in startPos..<n {
                if arrayA[i] == arrayB[j] {
                    arrayB[j] = "0"
                    break
                }
            }
        }
        debug += "\(arrayB) "
        
        for i in startPos..<n {
            if arrayB[i] != "0" {
                break
            }
            sequence += 1
        }
        debug += "sq: \(sequence) n: \(n) result: \(result)"
        
        if sequence > 0 {
            debug += " * "
            result += 1
            n = startPos + sequence - 1
        }
        if n <= 2 {
            n = A.count
            startPos += 1
        }
        
        print(debug)
        arrayB = Array(B)
    }
    
    return result
}
var A = "dBacaAA"
var B = "caBdaaA"

var C = "zzzX"
var D = "zzzX"
//solution(&C, &D)



public func matching(_ A : inout String, _ B : inout String) -> Int {
    let n = A.count
    var result = 0
    let arrayA = Array(A)
    var arrayB = Array(B)
    
    var initialIndex = 0
    var lastIndex = n
    
    while initialIndex < n {
        
        print("\(initialIndex), \(lastIndex)")
        for i in initialIndex..<lastIndex {
            var notFound = true
            for j in initialIndex..<lastIndex {
                if arrayA[i] == arrayB[j] {
                    arrayB[j] = "0"
                    notFound = false
                    break
                }
            }
            if notFound {
                break
            }
        }
        
        print(arrayB)
        //counting sequencial matches
        var count = 0
        for i in initialIndex..<lastIndex {
            if arrayB[i] == "0" {
                count += 1
            } else {
                break
            }
        }
        arrayB = Array(B)
        print(count)
        
        if count > 0 {
            result += 1
            lastIndex = initialIndex + count - 1

        } else {
            initialIndex += 1
            lastIndex = n
        }

    }
    return result
}

//matching(&C, &D)


//: [Next](@next)
