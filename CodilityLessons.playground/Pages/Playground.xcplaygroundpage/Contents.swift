//: [Previous](@previous)



func oddPositionRecursion(n: Int) -> Int {
    if n < 2 {
        return 1
    }
    return 2 + oddPositionRecursion(n: n - 1)
}

oddPositionRecursion(n: 10)

func ap2Recursion(n: Int) -> Int {
    if n < 1 {
        return 0
    }
    return 2 + ap2Recursion(n: n - 1)
}
ap2Recursion(n: 10)


for i in stride(from: 4, through: 0, by: -1){
    print(i) // 4, 3, 2, 1, 0
}
//: [Next](@next)
