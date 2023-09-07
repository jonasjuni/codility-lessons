//: [Previous](@previous)

import Foundation

//: Counting prefix sums
func prefixSum(_ A: [Int]) -> [Int]{
    let n = A.count
    var P = Array(repeating: 0, count: n + 1)
    for i in 1...n {
        P[i] = P[i - 1] + A[i - 1]
    }
    return P
}

func countTotal(_ A: [Int], _ x: Int, _ y: Int ) -> Int{
    let P = prefixSum(A)
    return P[y + 1] - P[x]
}

countTotal([1,2,3], 0, 2)


// this thread solution
func thisThreadMushroomPickerSlow(_ A: [Int], _ k: Int, _ m: Int) -> Int {
    
    var result = 0
    
    let maxLeftShift = min(k, m)
    for curLeftShift in 0...maxLeftShift {
        let first = k - curLeftShift
        let rightShift = min(k + (m  - curLeftShift * 2), A.count - 1)
        let last = max(k, rightShift)
        print("\(first), \(last)")
        
        var tentative = 0
        for i in first...last {
            tentative += A[i]
        }
        
        result = max(tentative, result)
    }
    return result
}

var A = [2, 3, 7, 5, 1, 3, 9]
var B = [9, 3, 1, 5, 7, 3, 2]
//thisThreadMushroomPickerSlow(A, 2, 6)
print("")
//thisThreadMushroomPickerSlow(B, 4, 6)

func mushroomPickerSlow(_ A: [Int], _ k: Int, _ m: Int) -> Int {
    
    let n = A.count
    var maxPick = 0
    // Left
    let left = min(k, m)
    for i in 0...left {
        let start = k - i
        let remaningMoves = m - i
        let end = min(start + remaningMoves, n - 1)
        print("\(start), \(end)")
        
        var runPicks = 0
        for j in start...end {
            runPicks += A[j]
        }
        if runPicks > maxPick {
            maxPick = runPicks
        }
    }
    print("_____")
    //right
    let right = min (m, n - 1 - k)
    for i in 0...right {
        let end = k + i
        let remaningMoves = m - i
        let start = max(0, min(k, end - remaningMoves))
        
        print("\(start), \(end)")
        var runPicks = 0
        for j in start...end {
            runPicks += A[j]
        }
        if runPicks > maxPick {
            maxPick = runPicks
        }
    }
    
    return maxPick
}

//mushroomPickerSlow(B, 4, 6)


func mushroomPicker (_ A: [Int], _ k: Int, _ m: Int) -> Int {
    let n = A.count
    var result = 0
    var P = [0]
    for i in 1...n {
        P.append(P[i - 1] + A[i - 1])
    }
    func countTotal(x: Int, y: Int) -> Int{
        return P[y + 1] - P[x]
    }
    
    let left = k
    for p in 0..<left {
        let start = k - p
        let remaningMoves = m - p
        let end = min(n - 1, start + remaningMoves)
        result = max(result, countTotal(x: start, y: end))
    }
    
    let right = n - 1 - k
    for p in 0..<right {
        let end = k + p
        let remaningMoves = m - p
        let start = max(0, min(k, end - remaningMoves))
        result = max(result, countTotal(x: start, y: end))
        
    }
    return result
}
mushroomPicker(B, 2, 6)

//Passing cars
public func passingCars(_ A : inout [Int]) -> Int {
    // Implement your solution here
    let n = A.count
    
    var P = [0]
    for i in 1...n {
        P.append(P[i - 1] + A[i - 1])
    }
    
    func countSlice (_ x: Int, _ y: Int) -> Int{
        return P[y + 1] - P[x]
    }
    
    var result = 0
    for i in 0..<n {
        if A[i] == 0 {
            result += countSlice(i + 1, n - 1)
        }
    }
    
    if result > 1000000000 {
        return -1
    }
    return result
}
var passing = [0, 1, 0, 1, 0]
passingCars(&passing)

public func countDiv(_ A : Int, _ B : Int, _ K : Int) -> Int {
    // Implement your solution here
    
    var result = 0
    
    for i in A...B {
        if( i % K == 0){
            result += 1
        }
    }
    
    return result
}

countDiv(111, 999, 13)

let tet = 11/2 - 6/2 + (6 % 2 == 0 ? 1 : 0)

public func countDivFast(_ A : Int, _ B : Int, _ K : Int) -> Int {
    // Implement your solution here
    return Int(B/K) - Int(A/K) + (A % K == 0 ? 1 : 0)
}

//GenomicRangeQuery


public func genomicRangeQuery(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    // Implement your solution here
    let m = P.count
    var prefixSum = ["A": [0], "C": [0], "G": [0]]
    let arrayS = Array(S)
    for i in 1...S.count {
        let nucleotide = arrayS[i - 1]
        switch nucleotide {
        case "A":
            prefixSum["A"]!.append(prefixSum["A"]![i - 1] + 1)
            prefixSum["C"]!.append(prefixSum["C"]![i - 1] + 0)
            prefixSum["G"]!.append(prefixSum["G"]![i - 1] + 0)
        case "C":
            prefixSum["A"]!.append(prefixSum["A"]![i - 1] + 0)
            prefixSum["C"]!.append(prefixSum["C"]![i - 1] + 1)
            prefixSum["G"]!.append(prefixSum["G"]![i - 1] + 0)
        case "G":
            prefixSum["A"]!.append(prefixSum["A"]![i - 1] + 0)
            prefixSum["C"]!.append(prefixSum["C"]![i - 1] + 0)
            prefixSum["G"]!.append(prefixSum["G"]![i - 1] + 1)
        default:
            prefixSum["A"]!.append(prefixSum["A"]![i - 1] + 0)
            prefixSum["C"]!.append(prefixSum["C"]![i - 1] + 0)
            prefixSum["G"]!.append(prefixSum["G"]![i - 1] + 0)
        }
    }
    
    var result: [Int] = []
    for i in 0..<m {
        if prefixSum["A"]![Q[i] + 1] - prefixSum["A"]![P[i]] > 0 {
            result.append(1)
        } else if prefixSum["C"]![Q[i] + 1] - prefixSum["C"]![P[i]] > 0 {
            result.append(2)
        } else if prefixSum["G"]![Q[i] + 1] - prefixSum["G"]![P[i]] > 0 {
            result.append(3)
        } else {
            result.append(4)
        }
    }
    return result
}

public func genomicRangeQuery2(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    // Implement your solution here
    let m = P.count
    var prefixSum = [[0], [0], [0]]
    let arrayS = Array<UInt8>(S.utf8)
    for i in 1...S.count {
        let nucleotide = arrayS[i - 1]
        switch nucleotide {
        case 65:
            prefixSum[0].append(prefixSum[0][i - 1] + 1)
            prefixSum[1].append(prefixSum[1][i - 1] + 0)
            prefixSum[2].append(prefixSum[2][i - 1] + 0)
        case 67:
            prefixSum[0].append(prefixSum[0][i - 1] + 0)
            prefixSum[1].append(prefixSum[1][i - 1] + 1)
            prefixSum[2].append(prefixSum[2][i - 1] + 0)
        case 71:
            prefixSum[0].append(prefixSum[0][i - 1] + 0)
            prefixSum[1].append(prefixSum[1][i - 1] + 0)
            prefixSum[2].append(prefixSum[2][i - 1] + 1)
        default:
            prefixSum[0].append(prefixSum[0][i - 1] + 0)
            prefixSum[1].append(prefixSum[1][i - 1] + 0)
            prefixSum[2].append(prefixSum[2][i - 1] + 0)
        }
    }
    
    var result: [Int] = []
    for i in 0..<m {
        if prefixSum[0][Q[i] + 1] - prefixSum[0][P[i]] > 0 {
            result.append(1)
        } else if prefixSum[1][Q[i] + 1] - prefixSum[1][P[i]] > 0 {
            result.append(2)
        } else if prefixSum[2][Q[i] + 1] - prefixSum[2][P[i]] > 0 {
            result.append(3)
        } else {
            result.append(4)
        }
    }
    return result
}

public func genomicRangeQuery3(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    // Implement your solution here
    let m = P.count
    var prefixSum = [[0], [0], [0]]
    for (i, v) in S.enumerated() {
        var a = v == "A" ? 1 : 0
        var c = v == "C" ? 1 : 0
        var g = v == "G" ? 1 : 0
        
        prefixSum[0].append(prefixSum[0][i] + a)
        prefixSum[1].append(prefixSum[1][i] + c)
        prefixSum[2].append(prefixSum[2][i] + g)
        
    }
    
    var result: [Int] = []
    for i in 0..<m {
        let from = Q[i] + 1
        let to = P[i]
        if prefixSum[0][from] - prefixSum[0][to] > 0 {
            result.append(1)
        } else if prefixSum[1][from] - prefixSum[1][to] > 0 {
            result.append(2)
        } else if prefixSum[2][from] - prefixSum[2][to] > 0 {
            result.append(3)
        } else {
            result.append(4)
        }
    }
    return result
}

var S = "CAGCCTA"
var P = [2, 5, 0]
var Q = [4, 5, 6]

//solution3(&S, &P, &Q)


// MinAvgTwoSlice
public func minAvgTwoSliceSlow(_ A : inout [Int]) -> Int {
    // Implement your solution here
    let n = A.count
    
    var prefixSum = [0]
    for i in 1...n {
        let sum = prefixSum[i - 1] + A[i - 1]
        prefixSum.append(sum)
    }
    
    print(A)
    print(prefixSum)
    
    var result = 0
    var smallest = Double.greatestFiniteMagnitude
    for i in 0..<n {
        for j in i + 1..<n {
            let sum = prefixSum[j + 1] - prefixSum[i]
            let average = Double(sum) / Double(j - i + 1)
            print("(\(i), \(j)) : \(sum)/\(j - i) = \(average)")
            if average < smallest {
                result = i
                smallest = average
            }
        }
    }
    print(smallest)
    return result
}

public func solution(_ A : inout [Int]) -> Int {
    // Implement your solution here
    let n = A.count
    var result = 0
    
    var smallestAVG = Double.greatestFiniteMagnitude
    if n > 3 {
        
        for i in 0..<n - 3 {
            //Check slice of 4
            let slice4AVG = Double(A[i] + A[i + 1] + A[i + 2] + A[i + 3]) / 4.0
            if slice4AVG < smallestAVG {
                result = i
                smallestAVG = slice4AVG
            }
            //Check slice of 3
            let slice3AVG = Double(A[i] + A[i + 1] + A[i + 2]) / 3.0
            if slice3AVG < smallestAVG {
                result = i
                smallestAVG = slice3AVG
            }
            //Check slice of 2
            let slice2AVG = Double(A[i] + A[i + 1]) / 2.0
            if slice2AVG < smallestAVG {
                result = i
                smallestAVG = slice2AVG
            }
            
        }
        
    }
    if n > 2 {
        // Check last 3
        let lastThreeSlice = Double(A[n - 3] + A[n - 2] + A[n - 1]) / 3.0
        if lastThreeSlice < smallestAVG {
            result = n - 3
            smallestAVG = lastThreeSlice
        }
        
        // Check last 2
        let lastTwoSlice = Double(A[n - 3] + A[n - 2]) / 2.0
        if lastTwoSlice < smallestAVG {
            result = n - 3
            smallestAVG = lastTwoSlice
        }
        
        // Check last 2
        let lastSlice = Double(A[n - 2] + A[n - 1]) / 2.0
        if lastSlice < smallestAVG {
            result = n - 2
            smallestAVG = lastSlice
        }
    }
    
    print(smallestAVG)
    return result
}

//var minAvg = [4, 2, 2, 5, 1, 5, 8,]
//var minAvg = [10, 10, 10, 1, 10]
var minAvg = [5, 3, 4, 4, 2,]
solution(&minAvg)


var conditionalTest = false
var secondConditionalTest = true

var tempArray = [1, 2, 3]

func testIfTest() {
    if conditionalTest, let sum = secondConditionalTest ? 3 + 1 : nil, false {
        print(String(sum))
    }
}

testIfTest()





// [9991911]
//: [Next](@next)
