//: [Previous](@previous)

///1.1. For loops
import Foundation

func loop(n: Int) {
    for i in 0..<n {
        print(i) // 0 to 99
    }
    print()
}
//loop(n: 100)

/*
 Example: We are given some positive integer n. Let’s compute the factorial of n and assign it to the variable factorial. The factorial of n is n! = 1·2·...·n. We can obtain it by starting with 1 and multiplying it by all the integers from 1 to n.
 */
func factorialInteractive(number: Int) -> Int {
    var total = 1
    for i in 1..<number + 1 {
        total *= i
    }
    return total
}
//factorialInteractive(number: 9)

/*
 Example: Let’s print a triangle made of asterisks (‘*’) separated by spaces. The triangle should consist of n rows, where n is a given positive integer, and consecutive rows should contain 1, 2, . . . , n asterisks. For example, for n = 4 the triangle should appear as follows:
 *
 * *
 * * *
 * * * *
 */

func drawTriangle(n: Int) -> Void {
    for i in 1..<n + 1 {
        var line: String = ""
        for _ in 1...i {
            line.append("* ")
        }
        print(line)
    }
    print()
}
//drawTriangle(n: 4)

/*
 Example: Let’s print a triangle made of asterisks (‘*’) separated by spaces and consisting of n rows again, but this time upside down, and make it symmetrical. Consecutive rows should contain 2n − 1, 2n − 3, ..., 3, 1 asterisks and should be indented by 0, 2, 4, ..., 2(n − 1) spaces. For example, for n = 4 the triangle should appear as follows:
 * * * * * * *
 * * * * *
 * * *
 *
 */
func drawInvertedPiramid(n: Int) -> Void {
    for i in 0..<n {
        var line = String()
        for _ in 0..<i * 2{
            line.append(" ")
        }
        for _ in 0..<2 * (n - i) - 1 {
            line.append("* ")
        }
        print(line)
    }
    print()
}
//drawInvertedPiramid(n: 4)

/// 1.2. While loops
///Example: Given a positive integer n, how can we count the number of digits in its decimal representation? One way to do it is convert the integer into a string and count the characters. Here, though, we will use only arithmetical operations instead. We can simply keep dividing the number by ten and count how many steps are needed to obtain 0.

func countDecimal(n: Int) -> Int {
    var total = 0
    var number = n
    while number > 0 {
        number /= 10
        total += 1
    }
    return total
}
countDecimal(n: 10)

/// The Fibonacci numbers form a sequence of integers defined recursively in the following way. The first two numbers in the Fibonacci sequence are 0 and 1, and each subse- quent number is the sum of the previous two. The first few elements in this sequence are: 0, 1, 1, 2, 3, 5, 8, 13. Let’s write a program that prints all the Fibonacci numbers, not exceeding a given integer n.
/// We can keep generating and printing consecutive Fibonacci numbers until we exceed n. In each step it’s enough to store only two consecutive Fibonacci numbers.

func printFibonacciUntil(n: Int) -> Void {
    var curr = 0
    var next = 1
    while curr <= n {
        print(curr)
        (curr, next) = (next, curr + next)
    }
}
//printFibonacciUntil(n: 8)

/// 1.3. Looping over collections of values
//Array
func printWeekDays() {
    let days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    for day in days {
        print(day)
    }
}
//printWeekDays()

//Set
func setPrintWeekDays() {
    var days: Set = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    days.insert("Sunday")
    for day in days {
        print(day)
    }
}
//setPrintWeekDays()

//Dictionary
func dicPrintWeekDays(){
    var days = ["mon" : "Monday",
                "tue" :"Tuesday",
                "wed" : "Wednesday",
                "thu" : "Thursday",
                "fri" :  "Friday",
                "sat" : "Saturday"]
    days["sun"] = "Sunday"
    
    for (key, value) in days {
        print("key: \(key), value: \(value)")
    }
}
//dicPrintWeekDays()

/// Activities
// BinaryGap

func binaryGap(_ N: Int) -> Int {
    var n = N
    var total = 0
    
    var count = 0
    var triggerCount = false
    
    while n > 0 {
        let bit = n % 2
        n /= 2
        
        if triggerCount {
            if bit == 0 {
                count += 1
            } else {
                total = max(count, total)
                count = 0
            }
        } else {
            if bit == 1 {
                triggerCount = true
            }
        }
    }
    return total
}
binaryGap(15)


//: [Next](@next)
