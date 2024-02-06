//: [Previous](@previous)



func oddPositionRecursion(n: Int) -> Int {
    if n < 2 {
        return 1
    }
    return 2 + oddPositionRecursion(n: n - 1)
}

//oddPositionRecursion(n: 10)

func ap2Recursion(n: Int) -> Int {
    if n < 1 {
        return 0
    }
    return 2 + ap2Recursion(n: n - 1)
}
//ap2Recursion(n: 10)


//for i in stride(from: 4, through: 0, by: -1){
//    print(i) // 4, 3, 2, 1, 0
//}



func mdcDuo(A: Int, B: Int) -> Int {
    var a = A
    var b = B
    var i = 2
    var result = 1
    
    while a > 1 && b > 1 {
        if a % i == 0 && b % i == 0 {
            result *= i
        }
        
        if a % i == 0 {
            a /= i
        }
        
        
        if b % i == 0 {
            b /= i
        }
        
        if a % i > 0 && b % i > 0 {
            i += 1
        }
    }
    
    return result
}

//mdcDuo(A: 90, B: 12)

func gcd(a: Int, b: Int) -> Int {
    print("\(a), \(b)")
    
    if a == 0 {
        return b
    }
    return gcd(a: b % a, b: a)
}

//gcd(a: 35, b: 6)

var a = 35
var b = 6
while a > b {
    a -= b
}
//print(a)


func dnaTest( S: String, P: [Int], Q: [Int]) -> [Int] {
    var result: [Int] = []
    
    var A: [Int] = [0]
    var C: [Int] = [0]
    var G: [Int] = [0]
    
    for (i, char) in S.enumerated() {
        var a = char == "A" ? 1 : 0
        var c = char == "C" ? 1 : 0
        var g = char == "G" ? 1 : 0
        
        A.append(A[i] + a)
        C.append(C[i] + c)
        G.append(G[i] + g)
    }
    
    func check(pSum:[Int], x: Int, y: Int) -> Bool {
        return pSum[y + 1] - pSum[x] > 0
    }
    
    for i in 0..<P.count {
        if check(pSum: A, x: P[i], y: Q[i]) {
            result.append(1)
        } else if check(pSum: C, x: P[i], y: Q[i]) {
            result.append(2)
        } else if check(pSum: G, x: P[i], y: Q[i]) {
            result.append(3)
        } else {
            result.append(4)
        }
    }
    return result
}

//dnaTest(S: "CAGCCTA", P: [2], Q: [4])

func permuCheck(A:[Int]) -> Int {
    
    let n = A.count
    var counter = Array(repeating: 0, count: n + 1)
    
    for item in A {
        if item > n  || item < 1{
            return 0
        }
        if counter[item] > 0 {
            return 0
        }
        counter[item] += 1
    }
    
    return 1
}

//permuCheck(A: [1,2,3,4])

func prefixSum(A:[Int], start: Int, end: Int) -> Int {
    let n = A.count
    var prefixSum = [0]
    for i in 0..<n {
        prefixSum.append(prefixSum[i] + A[i])
    }
    
    return prefixSum[end + 1] - prefixSum[start]
}

//prefixSum(A: [1, 2, 3, 4], start: 1, end: 3)

func countElements(A: [Int], mValue: Int) {
    var counter = Array(repeating: 0, count: mValue + 1)
    for element in A {
        counter[element] += 1
    }
    print(counter[2]) // 2
}

//countElements(A: [0, 1, 3, 1], mValue: 3)


func loopThroughRange() {
    for i in 0..<10 {
        print(i % 3)
    }
}

func loopRepeat() {
    for i in 0..<9 {
        print(i / 2)
    }
}

//loopRepeat()

func bubble(A: [Int]) -> [Int] {
    let n = A.count
    var result = A
    for i in stride(from: n - 1, to: 0, by: -1) {
        for j in 0..<i {
            print("\(j), \(j + 1)")
            if result[j] > result[j + 1] {
                result.swapAt(j, j + 1)
            }
        }
    }
    return result
}


func selectionSorting(A: [Int]) -> [Int] {
    let n = A.count
    var result = A
    
    for i in stride(from: 0, to: n - 1, by: 1) {
        var smallest = i
        for j in i + 1..<n {
            if result[j] < result[smallest] {
                smallest = j
            }
        }
        result.swapAt(i, smallest)
    }
    
    return result
}

func countSort(A: [Int], max: Int) -> [Int] {
    var count = Array(repeating: 0, count: max + 1)
    for element in A {
        count[element] += 1
    }
    
    var result: [Int] = []
    for i in 0..<count.count {
        for _ in 0..<count[i] {
            result.append(i)
        }
    }
    
    return result
}

func mergeSort(A: [Int]) -> [Int] {
    let n = A.count
    let midPoint = n / 2
    
    if n < 2 {
        return A
    }
    
    var left = mergeSort(A: Array(A[..<midPoint]))
    var right = mergeSort(A: Array(A[midPoint...]))
    
    func mergeArrays(A: inout [Int], B: inout [Int]) -> [Int] {
        var result: [Int] = []
        
        while !A.isEmpty && !B.isEmpty {
            if A.first! < B.first! {
                result.append(A.removeFirst())
            } else {
                result.append(B.removeFirst())
            }
        }
        return result + A + B
    }
    
    return mergeArrays(A: &left, B: &right)
}

mergeSort(A: [3, 2, 1, 1, 4])

//: [Next](@next)
