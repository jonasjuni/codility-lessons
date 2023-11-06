//: [Previous](@previous)

import Foundation

//: Counting elements — O(n + m)

func counting(A:[Int], m: Int) -> [Int]{
    let n = A.count
    var count = [Int](repeating: 0, count: m + 1)
    for element in A {
        count[element] += 1
    }
    
    return count
}

counting(A: [0, 0, 4, 2, 3, 1, 4], m: 4)

func swapElementsSlow(A:[Int], B:[Int]) -> Bool {
    let n = A.count
    var sumA = A.reduce(0, +)
    var sumB = B.reduce(0, +)
    
    //swap every element until sumA == sumB
    for i in 0..<n {
        for j in i..<n {
            var swapResult = A[i] - B[j]
            sumA -= swapResult
            sumB += swapResult
            if sumA == sumB { return true }
            // reset
            sumA += swapResult
            sumB -= swapResult
        }
    }
    return false
}

func swapElementsFast(A:[Int], B:[Int], m: Int) -> Bool{
    let n = A.count // 3
    
    let sumA = A.reduce(0, +) // 5
    let sumB = B.reduce(0, +) // 7
    
    var diff = sumB - sumA // Distance between B and A: 2
    if diff % 2 == 1 { return false } // if diference is odd we can't equilize: 0
    diff /= 2 // divide the difference for both arrays: 1
    
    let countA = counting(A: A, m: m) // [1, 0, 1, 1]
    
    for i in 0..<n { // loop every element of B and try to find a swapable element in A
        let equalizeValue = B[i] - diff // value in A that will equalize if swapped with B[i]
        if equalizeValue >= 0 && equalizeValue <= m {
            if  countA[equalizeValue] > 0 { return true }
        }
    }
    return false
}

var A = [3, 2, 0]
var B = [3, 3, 1]

//swapElementsSlow(A: A, B: B)
//swapElementsFast(A: A, B: B, m: 3)


//: Programing tasks


//: FrogRiverOne O(n^2)
public func frogRiverOneWRONG(_ X : Int, _ A : inout [Int]) -> Int {
    // Implement your solution here
    let n = A.count
    
    var count = [Int](repeating: 0, count: X + 1)
    for i in 0..<n {
        count[A[i]] += 1
        var leafs = 0
        for element in count {
            if element > 0 {
                leafs += 1
            }
        }
        if leafs >= X {
            return i
        }
    }
    return 0
}



//: ForgRiverOne O(n)

public func frogRiverOne(_ X : Int, _ A : inout [Int]) -> Int {
    // Implement your solution here
    
    let n = A.count
    var count = [Int](repeating: 0, count: X + 1)
    
    var leafs = 0
    for i in 0..<n {
        if count[A[i]] < 1 {
            leafs += 1
        }
        
        count[A[i]] += 1
        
        if leafs >= X { return i }
    }
    
    return -1
}

var frogRiverOneArray = [1, 3, 1, 4, 2, 3, 5, 4]

//frogRiverOne(5, &frogRiverOneArray) // 6

//: PermCheck
public func permCheck(_ A : [Int]) -> Int {
    // Implement your solution here
    let n = A.count
    
    //Get array biggest value and total sum
    var maxValue = 0
    var sum = 0
    for element in A {
        sum += element
        if element > maxValue { maxValue = element }
    }
    //Check for true permutation vs A total sum
    let permutationValue = n * (n + 1) / 2
    if permutationValue != sum { return 0 }
    
    // Check for false sum as [2, 2, 2]
    var count = [Int](repeating: 0, count: maxValue + 1)
    for element in A {
        if count[element] > 0 { return 0 }
        count[element] += 1
    }
    
    return 1
}
//permCheck([1, 1000000000])

//: MaxCounters
public func maxCounters(_ N : Int, _ A : inout [Int]) -> [Int] {
    // Implement your solution here
    var counter = [Int](repeating: 0, count: N)
    var maxCounter = 0
    var savedMaxCounter = 0
    for element in A {
        let i = element - 1
        if i < N {
            if counter[i] < savedMaxCounter {
                counter[i] = savedMaxCounter
            }
            
            counter[i] += 1
            
            if counter[i] > maxCounter {
                maxCounter =  counter[i]
            }
            
        } else {
            //set minimum value
            savedMaxCounter = maxCounter
        }
    }
    
    for i in 0..<N { //add minimun value for everybody
        if counter[i] < savedMaxCounter {
            counter[i] = savedMaxCounter
        }
    }
    
    return counter
}

//: MissingInteger
public func solution(_ A : inout [Int]) -> Int {
    // Implement your solution here
    var maxValue = 0
    for element in A {
        if element > maxValue {
            maxValue = element
        }
    }
    if maxValue <= 0 { return 1 } // A contains only negatives or zeros
    
    var counter = [Int](repeating: 0, count: maxValue + 1)
    
    //Counting
    for element in A {
        if element > 0 {
            counter[element] += 1
        }
    }
    
    for i in 1...maxValue {
        // found a missing? return it
        if counter[i] == 0 {
            return i
        }
    }
    
    return maxValue + 1
}

var missing = [ -1, 1 ]
solution(&missing)


//: [Next](@next)
