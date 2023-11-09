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
//swapExercide(A, B, 10)

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
//frogRiverOne(4, [1, 2])

func permCheck(_ A: [Int]) -> Int {
    let n = A.count
    var elementCounting = Array(repeating: 0, count: n + 1)
    var firstTimeCount = 0
    
    for element in A {
        if element <= n {
            if elementCounting[element] == 0 {
                firstTimeCount += 1
            }
            elementCounting[element] += 1
        } else {
            return 0
        }
    }
    
    if firstTimeCount == n {
        return 1
    }
    
    return 0
}
permCheck([2, 2, 3, 3])

func maxCounters(_ N: Int, _ A: [Int]) -> [Int] {
    
    var counter = Array(repeating: 0, count: N)
    var minValue = 0
    var currentMax = 0
    
    for element in A {
        let index = element - 1
        
        if element <= N {
            if counter[index] < minValue {
                counter[index] = minValue + 1
            } else {
                counter[index] += 1
            }
            currentMax = max(currentMax, counter[index])
        } else {
            minValue = currentMax
        }
    }

    return counter.map { element in
        if element < minValue {
            return minValue
        } else {
            return element
        }
    }
}

//print(maxCounters(5, [1, 1, 1, 2, 6, 2]))

func missingInteger(_ A: [Int]) -> Int {
    var counter = Array(repeating: 0, count: 1_000_001)
    
    for element in A {
        if element > 0 {
            counter[element] += 1
        }
    }
    
    for i in 1...1_000_001 {
        if counter[i] == 0 {
            return i
        }
    }
    
    return 1
}

missingInteger([-1_000_000, 1_000_000])

//: [Next](@next)
