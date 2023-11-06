//: [Previous](@previous)

import Foundation

//2.1 Creating an Arrray
let shopping = ["apple", "butter", "cheese"]

//Empty array
var empty: [String] = []

//Pre filled array
var temperatures = [Int](repeating: 0, count: 365)

//2.2 Accessing array values
let bread = shopping[0]

//2.3 Modifying array data
temperatures[42] = -25

//2.4 Iterating over arrays

let N = shopping.count

//2.1 Negative air temperature

func negative(_ temperatures: [Int]) -> Int {
    var total = 0
    
    for temperature in temperatures {
        if temperature < 0 {
            total += 1
        }
    }
    
    return total
}
negative(temperatures)

// 2.6 Reversing Array
func reverse<T>(_ source : [T]) -> [T] {
    var array = source
    let n = array.count
    
    for i in 0..<n / 2 {
        let last = n - i - 1
        array.swapAt(i, last)
    }
    return array
}
reverse(shopping)

// CyclicRotation
let arrayA = [0, 1, 2, 3, 4] //0
//           [4, 0, 1, 2, 3] //1
//           [3, 4, 0, 1, 2] //2
//           [2, 3, 4, 0, 1] //3
let n = 3

func cyclicRotation<T>( _ A: [T], _ K: Int ) -> [T] {
    if A.isEmpty {
        return []
    }
    
    let index = A.count - (K % A.count)
    return Array(A[index...] + A[..<index])
}
cyclicRotation(arrayA, n)

// OddOccurrencesInArray

func oddOccurrencesInArray(_ A: [Int]) -> Int {
    
    var result = 0
    for element in A {
        result ^= element //XOR 
        print(result)
    }
    return result
}
oddOccurrencesInArray([2, 2, 3, 2, 2])

//: [Next](@next)
