//: [Previous](@previous)
///Chapter 4
///Counting elements

import Foundation

func counting(_ A: [Int], _ m: Int) -> [Int] {
    var count: [Int] = Array(repeating: 0, count: m + 1)
    for element in A {
        count[element] += 1
    }
    return count
}
counting([0, 0, 4, 2, 3, 1, 4], 4)

func swapExercide(_ A: [Int], _ B: [Int], _ m: Int) -> Bool {
    
    var aSum = A.reduce(0, +)
    var bSum = B.reduce(0, +)
    
    let difference = bSum - aSum
    
    if difference % 2 == 0 {
        let couting = counting(A, m)
        
        for element in B {
            let targetValue = difference / 2 - element
            
            if targetValue >= 0 && targetValue <= m {
                if couting[targetValue] > 0 {
                    print("Swap \(targetValue) in A with \(element) in B")
                    return true
                }
            }
        }
    }

    return false
    
}

let A = [6, 4, 0]
let B = [1, 1, 10]
swapExercide(A, B, 10)

func frogRiverOne(_ X: Int, _ A: [Int]) -> Int {
    
    var leafsCounting = Array(repeating: 0, count: X + 1)
    var coveredSpaces = 0
    let n = A.count
    
    for i in 0..<n {
        let position = A[i]
        if leafsCounting[position] == 0 {
            coveredSpaces += 1
        }
        leafsCounting[position] += 1
        if coveredSpaces >= X {
            return i
        }
    }
    
    return -1
}
frogRiverOne(2, [1, 2])


//: [Next](@next)
