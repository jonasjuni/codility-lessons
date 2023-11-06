//: [Previous](@previous)

import Foundation

//3.1 Which is the dominant operation?
//O(n) - linear complexity
func dominant(_ n: Int) -> Int {
    var result = 0
    for _ in 0..<n {
        result += 1 // DOMINANT
    }
    return result
}

//3.2 Constant time O(1)
func constant(_ n: Int) -> Int {
    return n * n
}

//3.3 Logarithmic time O(log n)
// The value of n is halved on each operation
func logarithmic(_ n: inout Int) -> Int {
    var result = 0
    while n > 1 {
        n /= 2
        result += 1
    }
    return result
}

//3.4 Linear time O(n)
func linear(_ n: Int, _ A: [Int]) -> Int {
    for i in 0..<n {
        if A[i] == 0 {
            return 0
        }
    }
    return 1
}

// 3.5 Quadratic time
func quadratic(_ n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for _ in i..<n {
            result += 1
        }
    }
    return result
}

// 3.6 Linear time O(n + m)
func linear2(_ n: Int, _ m: Int) -> Int {
    var result = 0
    for i in 0..<n {
        result += i
    }
    for j in 0..<m {
        result += j
    }
    return result
}

//Exercise
func slowSolution(_ n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for _ in 0..<(i + 1) {
            result += 1
        }
    }
    return result
}
slowSolution(5)

func secondSolution(_ n: Int) -> Int {
    var result = 0
    for i in 1...n {
        result += i
    }
    return result
}
secondSolution(5)

//Arithmetic progression
func thirdSolution(_ n: Int) -> Int {
    return n * (1 + n) / 2
}
thirdSolution(5)

//Exercise

//FrogJmp
func frogJmp(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    let jumps = ceil(Double((Y - X)) / Double (D))
    return Int(jumps)
}
frogJmp(90, 85, 30)

//PermMissingElem
func permMissingElem(_ A: [Int]) -> Int {
    
    let n = A.count + 1
    let progSum = n * (1 + n) / 2
    let aTotal = A.reduce(0, +)
    return progSum - aTotal
}
permMissingElem([2, 3, 1, 5])

//TapeEquilibrium
func tapeEquilibrium(_ A: [Int]) -> Int {
    let n = A.count
    var prefixSum = [0]
    
    for i in 0..<n {
        prefixSum.append(prefixSum[i] + A[i])
    }
    
    var result = abs(prefixSum[1] - (prefixSum.last! - prefixSum[1]))
    print(result)
    for j in 2..<n {
        let lhs = prefixSum[j]
        let rhs = prefixSum.last! - prefixSum[j]
        result = min(result, abs(lhs - rhs))
        print(result)
    }

    return result
}

tapeEquilibrium([2005, 0, 2000, 0])


//: [Next](@next)
