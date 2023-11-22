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
//prefixSum([3, 5, 2, 9, 10])

func suffixSum(_ A: [Int]) -> [Int] {
    let n = A.count
    var result = Array(repeating: 0, count: n)
    result[n - 1] = A[n - 1]
    
    for i in (0..<(n - 1)).reversed() {
        result[i] = result[i + 1] + A[i]
    }
    
    return result
}
//suffixSum([3, 5, 2, 9, 10])

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
//passingCars([0, 1, 0, 1, 1])

func countDiv(_ A: Int, _ B: Int, _ K: Int) -> Int {
    return B / K - A / K + (A % K == 0 ? 1 : 0)
}
//countDiv(6, 12, 4)

func genomicRangeQuery(_ S: String, _ P: [Int], _ Q: [Int]) -> [Int]{ 
    var prefixSum = [[0], [0], [0]]
    
    for (i, element) in S.enumerated() {
        let a = element == "A" ? 1 : 0
        let c = element == "C" ? 1 : 0
        let g = element == "G" ? 1 : 0
        
        prefixSum[0].append(prefixSum[0][i] + a)
        prefixSum[1].append(prefixSum[1][i] + c)
        prefixSum[2].append(prefixSum[2][i] + g)
    }

    let m = P.count
    var result: [Int] = []
    
    for i in 0..<m {
        let start = P[i]
        let end = Q[i] + 1
        
        if prefixSum[0][end] - prefixSum[0][start] > 0 {
            result.append(1)
        } else if prefixSum[1][end] - prefixSum[1][start] > 0 {
            result.append(2)
        } else if prefixSum[2][end] - prefixSum[2][start] > 0 {
            result.append(3)
        } else {
            result.append(4)
        }
    }
    
    return result
}

let S = "CAGCCTA"
let P = [2, 5, 0]
let Q = [4, 5, 6]
genomicRangeQuery("AC", [0, 0, 1], [0, 1, 1])


//: [Next](@next)
