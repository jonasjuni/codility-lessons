//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let arrayTest0 = [0, 1, 2, 3, 5]
let arrayTest1 = [2, 1, 4, 3, 5]
let arrayTest2 = [0, 2, 5, 3, 4]

func pyramidOfDoon() {
    if let index0 = arrayTest0.firstIndex(of: 2) {
        if let index1 = arrayTest1.firstIndex(of: 2) {
            if let index2 = arrayTest2.firstIndex(of: 2) {
                print("First index of 2: \(index0) \(index1) \(index2)")
            }
        }
    }
}

func ifLet() {
    if true,
       let index0 = arrayTest0.firstIndex(of: 2),
       let index1 = arrayTest1.firstIndex(of: 2),
       let index2 = arrayTest2.firstIndex(of: 2) {
        print("First index of 2: \(index0) \(index1) \(index2)")
    }
}

ifLet()


func earlyReturn() {
    if  arrayTest0.firstIndex(of: 2) == nil { return }
    if  arrayTest1.firstIndex(of: 2) == nil { return }
    if  arrayTest2.firstIndex(of: 2) == nil { return }
    
    print("First index of 2: \(arrayTest0.firstIndex(of: 2)!) \(arrayTest1.firstIndex(of: 2)!) \(arrayTest2.firstIndex(of: 2)!)")
}

func guardFunction() {
    guard  let index0 = arrayTest0.firstIndex(of: 2) else {
        return
    }
    guard  let index1 = arrayTest1.firstIndex(of: 2) else {
        return
    }
    guard  let index2 = arrayTest2.firstIndex(of: 2) else {
        return
    }
    
    print("First index of 2: \(index0) \(index1) \(index2)")
}

//pyramidOfDoon()
//earlyReturn()
//guardFunction()

func isAPrimeLoop(number: Int) -> String {
    for i in 2..<number {
        if number % i == 0 {
            return "❌ \(number) is NOT a prime"
        }
    }
    return "✅ \(number) is a prime!"
}

isAPrimeLoop(number: 7)

let number = 6
func isAPrimeRecursion(value: Int, n: Int = 2) -> String {
    if value <= 1 {
        return "❌ \(number) is NOT a prime"
    }
    
    if n == value {
        return "✅ \(number) is a prime!"
    }
    print("\(number) % \(n) = \(number % n)")
    if value % n == 0 {
        return "❌ \(number) is NOT a prime"
    }
    return isAPrimeRecursion(value: number, n: n + 1)
}

isAPrimeRecursion(value: number)

//: [Next](@next)
