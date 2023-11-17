//: [Previous](@previous)

import Foundation

///Prefix sum

func prefixSum(_ A: [Int]) -> [Int] {
    var result = [0]
    let n = A.count
    
    for i in 0..<n {
        result.append(result[i] + A[i])
    }
    return result
}

prefixSum([3, 5, 2, 9, 10])

func suffixSum(_ A: [Int]) -> [Int] {
    let n = A.count
    var result = Array(repeating: 0, count: n)
    result[n - 1] = A[n - 1]
    
    for i in (0..<(n - 1)).reversed() {
        result[i] = result[i + 1] + A[i]
    }
    
    return result
}

suffixSum([3, 5, 2, 9, 10])

func countTotal(_ P: [Int], _ x: Int, _ y: Int) -> Int {
    return P[y + 1] - P[x]
}

//5.1 Mushroom

func mushRoomPickerNaive(_ A: [Int], k: Int, m: Int) -> Int {
    let n = A.count
    var prefixSum = [0]
    
    for i in 0..<n {
        prefixSum.append(prefixSum[i] + A[i])
    }

    func count(x: Int, y: Int) -> Int {
        return prefixSum[y + 1] - prefixSum[x]
    }

    var result = 0
    let rhs = n - 1 - k
    
    for p in 0...min(m, rhs) {
        
        let end = k + p
        let leftover = min(k, k - (m - 2 * p))
        let start = max(0, leftover)
        
        result = max(result, count(x: start, y: end))
    }

    let lhs = k
    for p in 0...min(m, lhs) {
        
        let start = k - p
        let leftover = max(k, k + m - 2 * p)
        let end = min(n - 1, leftover)
        
        result = max(result, count(x: start, y: end))
    }
    
    return result
}
//mushRoomPickerNaive([ 2, 3, 7, 5, 1, 3, 9], k: 4, m: 6)

//Exercises

func passingCars(_ A: [Int]) -> Int {
    let n = A.count
    var prefixSum = [0]
    
    for i in 0..<n {
        prefixSum.append(prefixSum[i] + A[i])
    }
    
    func count(x: Int, y: Int) -> Int {
        return prefixSum[y + 1] - prefixSum[x]
    }
    
    var result = 0
    for i in 0..<n {
        if A[i] == 0 {
            result += count(x: i, y: n - 1)
            if result > 1_000_000_000 {
                return -1
            }
        }
    }
    return result
}

passingCars([0, 1, 0, 1, 1])


//: [Next](@next)
